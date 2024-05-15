import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  TextEditingController searchBarController = TextEditingController();

  void searchMusicByMusicName(String musicName) async {
    var dioClient = Dio();
    try {
      dio.Response response = await dioClient.get('http://ws.audioscrobbler.com/2.0/', queryParameters: {
        'method': 'track.search',
        'track': musicName,
        'api_key': state.apiKeyLastFm,
        'format': 'json',
        'limit': 30,
      });
      log(response.data.toString());
    } on DioError catch (e) {
      log('DioError received: ${e.response?.data ?? e.message}');
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

      var topTracks = response.data['tracks']['track'];
      state.topTracks.value = response.data['tracks']['track'];

      log('top tracks: ${response.data['tracks']['track']}');
      for (var track in topTracks) {
        log('Track: ${track['name']} by ${track['artist']['name']}');
      }
    } on DioError catch (e) {
      log('DioError received: ${e.response?.data ?? e.message}');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTopTracks();
  }
}
