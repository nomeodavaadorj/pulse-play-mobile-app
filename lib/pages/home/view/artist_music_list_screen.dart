import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/components/music_list_widget.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';

import '../../../style/my_fonts.dart';

class ArtistMusicListScreen extends GetWidget<HomeController> {
  final dynamic artist;

  const ArtistMusicListScreen({super.key, this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          artist['name'],
          style: const TextStyle(fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
              artist['image'].last['#text'] ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjeIfQhfDbKYjAc0q26mdK_CZPOgSrfkrKQ7uNgR1vl_gUsxwz4tGEnphN3hHF9yaDUFY&usqp=CAU',
            ),
            Expanded(
              child: Obx(
                () => MusicListWidget(controller.state.artistTracks.length, controller.state.artistTracks, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
