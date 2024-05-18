import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/show_alert_dialog.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:pulse_play_mobile_app/pages/home/view/music_list_screen.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

import '../../../style/my_fonts.dart';
import '../components/user_profile_settings_item.dart';

class UserProfileScreen extends GetWidget<HomeController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
        title: const Text(
          'Миний бүртгэл',
          style: TextStyle(
            fontFamily: MyFonts.proDisplay,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/profile_picture.png',
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Text(
              controller.state.user['name'],
              style: const TextStyle(fontSize: 30, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w800),
            ),
            Text(
              '${controller.state.userPlaylists.length} тоглуулах жагсаалт, ${controller.state.userLikedSongs.length} дуртай дуу',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: MyFonts.proDisplay, fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                /// todo: Хэрэглэгчийн бүртгэл гэсэн хуудас руу үсэрнэ.
              },
              child: const UserProfileSettings(
                leadingIcon: 'assets/icons/ic_user.png',
                title: 'Бүртгэл',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                ///todo: playlistuudiin list haruulah
              },
              child: const UserProfileSettings(
                leadingIcon: 'assets/icons/ic_playlist.png',
                title: 'Тоглуулах жагсаалт',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                ///todo: bas list haruulnaa thde barg hud ch ymudo
              },
              child: const UserProfileSettings(
                leadingIcon: 'assets/icons/ic_downloaded.png',
                title: 'Татсан дуунууд',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                MusicListScreen(
                  controller.state.userLikedSongs,
                  'Дуртай дуунууд',
                  false,
                );
              },
              child: const UserProfileSettings(
                leadingIcon: 'assets/icons/ic_heart.png',
                title: 'Дуртай дуунууд',
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic_logout.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(ShowAlertDialog(
                        onTap: () {
                          Get.toNamed('/login');
                          Get.deleteAll();
                        },
                        title: 'Гарах',
                        onTapText: 'Тийм',
                        subtitle: 'Та гарахдаа итгэлтэй байна уу?'));
                  },
                  child: const Text(
                    'Гарах',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600, fontFamily: MyFonts.proDisplay, color: MyColors.logoutColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
