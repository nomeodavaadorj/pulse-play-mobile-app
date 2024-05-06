import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class PlaylistItem extends StatelessWidget {
  final String imgUrl;
  final String playlistName;
  final int amountOfMusic;
  final double width;
  final double height;

  const PlaylistItem(
      {super.key, required this.imgUrl, required this.playlistName, required this.amountOfMusic, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        color: MyColors.playlistItemColor,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            Container(
              width: width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      playlistName,
                      style: const TextStyle(fontFamily: MyFonts.proDisplay, fontSize: 14, fontWeight: FontWeight.w600, color: MyColors.colorWhite),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    "$amountOfMusic дуу",
                    style: const TextStyle(fontFamily: MyFonts.proDisplay, fontSize: 11, fontWeight: FontWeight.w600, color: MyColors.colorWhite),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
