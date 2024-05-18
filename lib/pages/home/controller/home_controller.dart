import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  TextEditingController searchBarController = TextEditingController();

  void loadUserData() async {
    try {
      Map<String, dynamic> data = await fetchUserData();
      state.user.assignAll(data);
    } catch (e) {
      log('Error fetching user data: $e');
    }
  }

  Future<void> fetchUserPlaylistsAndLikes(String userId) async {
    try {
      // Fetch playlists
      DocumentSnapshot playlistDoc = await FirebaseFirestore.instance.collection('playlists').doc(userId).get();
      if (playlistDoc.exists && playlistDoc.data() != null) {
        Map<String, dynamic> playlistData = playlistDoc.data()! as Map<String, dynamic>;
        if (playlistData.containsKey('tracks')) {
          state.userPlaylists.assignAll(playlistData['tracks'] as List<dynamic>);
        } else {
          log('No tracks key found in the playlist document.');
        }
      } else {
        log('No playlist document found.');
      }

      // Fetch liked songs
      DocumentSnapshot likedDoc = await FirebaseFirestore.instance.collection('liked').doc(userId).get();
      if (likedDoc.exists && likedDoc.data() != null) {
        Map<String, dynamic> likedData = likedDoc.data()! as Map<String, dynamic>;
        if (likedData.containsKey('tracks')) {
          state.userLikedSongs.assignAll(likedData['tracks'] as List<dynamic>);
        } else {
          log('No tracks key found in the liked document.');
        }
      } else {
        log('No liked document found.');
      }
    } catch (e) {
      log('Error fetching playlists or liked songs: $e');
      throw Exception('Failed to fetch playlists or liked songs');
    }
  }

  ///Хэрэглэгчийн мэдээллийг database-с авах функц
  Future<Map<String, dynamic>> fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      log('No user is currently logged in.');
      throw Exception('User is not logged in.');
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        throw Exception('User data not found.');
      }
    } on FirebaseAuthException catch (e) {
      log('Error fetching user data: ${e.code}');
      throw Exception('Failed to fetch user data: ${e.message}');
    }
  }

  Future<List> searchMusicByMusicName(String musicName) async {
    var dioClient = Dio();
    try {
      dio.Response response = await dioClient.get('http://ws.audioscrobbler.com/2.0/', queryParameters: {
        'method': 'track.search',
        'track': musicName,
        'api_key': state.apiKeyLastFm,
        'format': 'json',
        'limit': 30,
      });

      state.searchResults.value = response.data['results']?['trackmatches']?['track'];
      log('search result:${state.searchResults}');
      return response.data['results']?['trackmatches']?['track'];
    } on DioError catch (e) {
      log('DioError received: ${e.response?.data ?? e.message}');
      return e.response?.data ?? e.message;
    }
  }

  Future<void> getTopTracks() async {
    var dioClient = Dio();

    try {
      dio.Response response = await dioClient.get(
        'http://ws.audioscrobbler.com/2.0/',
        queryParameters: {
          'method': 'geo.getTopTracks',
          'country': 'Mongolia',
          'api_key': state.apiKeyLastFm,
          'format': 'json',
        },
      );
      state.topTracks.value = response.data['tracks']['track'];

      log('top tracks: ${response.data['tracks']['track']}');
    } on DioError catch (e) {
      log('DioError received: ${e.response?.data ?? e.message}');
    }
  }

  Future<void> addTrackToPlaylist(User user, Map<String, dynamic> track) async {
    DocumentReference playlistRef = FirebaseFirestore.instance.collection('playlists').doc(user.uid);
    await playlistRef.update({
      'tracks': FieldValue.arrayUnion([track])
    });
  }

  Future<List<dynamic>> fetchUserPlaylist(User user) async {
    DocumentSnapshot playlistDoc = await FirebaseFirestore.instance.collection('playlists').doc(user.uid).get();
    Map<String, dynamic>? data = playlistDoc.data() as Map<String, dynamic>?;

    if (playlistDoc.exists && data != null && data.containsKey('tracks')) {
      return data['tracks'] as List<dynamic>;
    } else {
      throw Exception('No playlist found');
    }
  }

  /// Fetches the top artists from Last.fm
  Future<List<dynamic>> getTopArtists() async {
    var dioClient = Dio();

    try {
      dio.Response response = await dioClient.get(
        'http://ws.audioscrobbler.com/2.0/',
        queryParameters: {
          'method': 'chart.getTopArtists',
          'api_key': state.apiKeyLastFm,
          'format': 'json',
          'limit': 50,
        },
      );

      if (response.data['artists'] != null) {
        state.topArtists.value = response.data['artists']['artist'];
        return response.data['artists']['artist'];
      } else {
        throw Exception('Failed to load top artists');
      }
    } on DioError catch (e) {
      log('DioError received: ${e.response?.data ?? e.message}');
      throw Exception('Error fetching top artists: ${e.message}');
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    loadUserData();
    log('user: ${state.user}');
    getTopTracks();
    getTopArtists();
  }
}
