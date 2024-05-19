import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeState {
  final String apiKeyLastFm = "202127100faf64ce8e16b5d97b3fd855";
  final String apiSecretLastFm = "37a6335de15ca3a1d1a8c86b844c80da";
  RxList<dynamic> topTracks = RxList();
  RxList<dynamic> userPlaylists = RxList();
  RxList<dynamic> userLikedSongs = RxList();
  RxList<dynamic> artistTracks = RxList();
  RxMap<String, dynamic> user = RxMap();
  RxList<dynamic> searchResults = RxList();
  RxList<dynamic> topArtists = RxList();
}
