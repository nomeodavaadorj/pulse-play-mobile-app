import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/music_setting_bottomsheet.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPlayerScreen extends GetWidget<HomeController> {
  final dynamic music;
  final bool isSearchResult;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.newPlayer();

  MusicPlayerScreen(this.music, this.isSearchResult, {super.key});

  @override
  Widget build(BuildContext context) {
    audioPlayer.open(
      Audio.network(music['url']),
      autoStart: true,
      showNotification: true,
    );

    double computedMin = (int.parse(music['duration'] ?? "180") / 60).toDouble();
    double computedMax = audioPlayer.current.valueOrNull?.audio.duration.inSeconds.toDouble() ?? 0.0;
    if (computedMin > computedMax) {
      double temp = computedMin;
      computedMin = computedMax;
      computedMax = temp;
    }
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
        title: const Text(
          'Одоо тоглуулж буй',
          style: TextStyle(
            fontFamily: MyFonts.proDisplay,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return const MusicSettingBottomsheet();
                    });
              },
              child: Image.asset(
                'assets/icons/ic_settings.png',
                height: 20,
                width: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                music['image'].last['#text'] ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjeIfQhfDbKYjAc0q26mdK_CZPOgSrfkrKQ7uNgR1vl_gUsxwz4tGEnphN3hHF9yaDUFY&usqp=CAU',
                height: 355,
                width: 355,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(music['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(isSearchResult ? music['artist'] : music['artist']['name'], style: const TextStyle(fontSize: 18, color: Colors.grey)),
            Slider(
              min: computedMin,
              max: computedMax,
              value: audioPlayer.currentPosition.valueOrNull?.inSeconds.toDouble().clamp(computedMin, computedMax) ?? 0.0,
              onChanged: (value) {
                if (audioPlayer.current.hasValue) {
                  audioPlayer.seek(Duration(seconds: value.toInt()));
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/icons/ic_lyrics.png',
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                  ),
                ),
                if (music['url'].isNotEmpty || music['url'] != null)
                  ElevatedButton(
                    onPressed: () {
                      final Uri url = Uri.parse(music['url']);
                      _launchUrl(url);
                    },
                    child: Image.asset(
                      'assets/icons/ic_global.png',
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/icons/ic_heart_not_filled.png',
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: MyColors.colorDarkGrey.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.skip_previous)),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      audioPlayer.isPlaying.value ? Icons.pause : Icons.play_arrow_rounded,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                  onTap: () {
                    audioPlayer.isPlaying.value ? audioPlayer.pause() : audioPlayer.play();
                  },
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 44,
                    width: 44,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: MyColors.colorDarkGrey.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.skip_next),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
