import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/components/music_list_widget.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class MusicListScreen extends GetWidget<HomeController> {
  final dynamic musicList;
  final String title;
  final bool isSearch;

  const MusicListScreen(this.musicList, this.title, this.isSearch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: MusicListWidget(musicList.length, musicList, isSearch),
    );
  }
}
