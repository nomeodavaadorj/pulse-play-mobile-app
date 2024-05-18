import 'package:flutter/cupertino.dart';

import '../../../style/my_fonts.dart';

class UserProfileSettings extends StatelessWidget {
  final String leadingIcon;
  final String title;

  const UserProfileSettings({super.key, required this.leadingIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                leadingIcon,
                height: 20,
                width: 20,
                alignment: Alignment.bottomLeft,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 23, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Image.asset(
            'assets/icons/ic_settings.png',
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }
}
