import 'package:flutter/cupertino.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class MusicSettingItem extends StatelessWidget {
  final String leadingIcon;
  final Function onTap;
  final String title;

  const MusicSettingItem({super.key, required this.leadingIcon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            leadingIcon,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 13.0,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: MyFonts.proDisplay,
            ),
          ),
        ],
      ),
    );
  }
}
