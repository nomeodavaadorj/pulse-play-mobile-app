import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

import '../pages/home/components/music_setting_item.dart';

class MusicSettingBottomsheet extends GetWidget<HomeController> {
  const MusicSettingBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 5,
              decoration: BoxDecoration(color: MyColors.playlistItemColor, borderRadius: BorderRadius.circular(30.0)),
            ),
            const SizedBox(
              height: 30,
            ),
            MusicSettingItem(
              leadingIcon: 'assets/icons/ic_heart_not_filled.png',
              title: 'Дуртай дуунд нэмэх',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            MusicSettingItem(
              leadingIcon: 'assets/icons/ic_add.png',
              title: 'Дуртай дуунд нэмэх',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            MusicSettingItem(
              leadingIcon: 'assets/icons/ic_minus.png',
              title: 'Дууг нуух',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            MusicSettingItem(
              leadingIcon: 'assets/icons/ic_share.png',
              title: 'Хуваалцах',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
