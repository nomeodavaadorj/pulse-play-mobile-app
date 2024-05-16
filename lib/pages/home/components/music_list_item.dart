import 'package:flutter/cupertino.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class MusicListItem extends StatelessWidget {
  final dynamic music;

  const MusicListItem({super.key, this.music});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(25.0), child: Image.network(music['img'] ?? '')),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                Text(
                  music['name'],
                  style: const TextStyle(
                    fontFamily: MyFonts.proDisplay,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  music['artist'],
                  style: const TextStyle(
                    fontFamily: MyFonts.proDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
