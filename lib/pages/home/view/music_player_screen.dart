import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicPlayerScreen extends GetWidget<HomeController> {
  final dynamic music;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.newPlayer();

  MusicPlayerScreen(this.music, {super.key});

  @override
  Widget build(BuildContext context) {
    audioPlayer.open(
      Audio.network(music['url']),
      autoStart: true,
      showNotification: true,
    );

    double computedMin = (int.parse(music['duration']) * 0.6).toDouble();
    double computedMax = audioPlayer.current.valueOrNull?.audio.duration.inSeconds.toDouble() ?? 0.0;
    if (computedMin > computedMax) {
      double temp = computedMin;
      computedMin = computedMax;
      computedMax = temp;
    }
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(Icons.keyboard_arrow_down),
        ),
        title: const Text('Одоо тоглуулж буй'),
        actions: [
          ElevatedButton(onPressed: () {}, child: const Icon(Icons.settings)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                music['image'].last['#text'] ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjeIfQhfDbKYjAc0q26mdK_CZPOgSrfkrKQ7uNgR1vl_gUsxwz4tGEnphN3hHF9yaDUFY&usqp=CAU',
                height: 355,
                width: 355,
              ),
            ),
            const SizedBox(height: 24),
            Text(music['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(music['artist']['name'], style: const TextStyle(fontSize: 18, color: Colors.grey)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(audioPlayer.isPlaying.value ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    audioPlayer.isPlaying.value ? audioPlayer.pause() : audioPlayer.play();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
