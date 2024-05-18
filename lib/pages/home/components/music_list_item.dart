import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/view/music_player_screen.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class MusicListItem extends StatelessWidget {
  final dynamic music;

  const MusicListItem({super.key, this.music});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(MusicPlayerScreen(music, false)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 85,
        child: Row(
          children: [
            SizedBox(
                width: 85,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(music['img'] ??
                        'https://static.vecteezy.com/system/resources/previews/013/964/096/non_2x/minimalistic-abstract-line-background-illustration-for-album-music-or-other-cover-design-element-of-lines-with-same-random-and-noise-free-vector.jpg'))),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    music['name'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: MyFonts.proDisplay,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    music['artist']['name'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: MyFonts.proDisplay,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
