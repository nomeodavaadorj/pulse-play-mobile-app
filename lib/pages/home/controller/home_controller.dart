import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../state/home_state.dart';

class HomeController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  final state = HomeState();

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
}
