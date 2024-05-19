import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/show_alert_dialog.dart';
import 'package:pulse_play_mobile_app/pages/home/components/playlist_item.dart';
import 'package:pulse_play_mobile_app/pages/home/components/top_artist_item.dart';
import 'package:pulse_play_mobile_app/pages/home/components/top_track_item.dart';
import 'package:pulse_play_mobile_app/pages/home/view/artist_music_list_screen.dart';
import 'package:pulse_play_mobile_app/pages/home/view/music_list_screen.dart';
import 'package:pulse_play_mobile_app/pages/home/view/music_player_screen.dart';
import 'package:pulse_play_mobile_app/pages/home/view/user_profile_screen.dart';

import '../../../components/basic_search_bar.dart';
import '../../../style/my_fonts.dart';
import '../../../utils/my_colors.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: BasicSearchBar(
                        height: screenWidth * 0.1,
                        width: screenWidth * 0.65,
                        controller: controller.searchBarController,
                        onSubmitted: (value) async {
                          await controller.searchMusicByMusicName(value);
                          Get.to(MusicListScreen(controller.state.searchResults, 'Хайлтын илэрц', true));
                          controller.searchBarController.clear();
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.state.user.isEmpty) {
                          Get.dialog(ShowAlertDialog(
                              onTap: () {
                                Get.deleteAll();
                                Get.toNamed('/login');
                              },
                              title: 'Нэвтрэнэ үү',
                              onTapText: 'Нэвтрэх',
                              subtitle: 'Та энэ үйлдлийг хийхийн тулд нэвтрэх хэрэгтэй.'));
                        } else {
                          Get.to(const UserProfileScreen());
                        }
                      },
                      child: Container(
                          height: screenWidth * 0.13,
                          width: screenWidth * 0.13,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                          child: Image.asset('assets/icons/ic_avatar.png')),
                    ),
                  ],
                ),
                ObxValue<RxMap>(
                    (user) => user.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Миний тоглуулах жагсаалтууд',
                                style: TextStyle(
                                  fontFamily: MyFonts.proDisplay,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.colorWhite,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PlaylistItem(
                                        imgUrl: 'https://i1.sndcdn.com/artworks-tXi1CjK5mk0il0ME-CRsykQ-t500x500.jpg',
                                        playlistName: 'Chill musics',
                                        amountOfMusic: 56,
                                        width: screenWidth * 0.45,
                                        height: screenWidth * 0.2),
                                    PlaylistItem(
                                        imgUrl: 'https://i1.sndcdn.com/artworks-e9VyPoZI8NbwkrX2-ztQ4Hw-t500x500.jpg',
                                        playlistName: 'Kpop musics',
                                        amountOfMusic: 90,
                                        width: screenWidth * 0.45,
                                        height: screenWidth * 0.2)
                                  ],
                                ),
                              ),
                              const Text(
                                'Дуртай дуунууд',
                                style: TextStyle(
                                  fontFamily: MyFonts.proDisplay,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.colorWhite,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (controller.state.userLikedSongs.isEmpty) const Text('Одоогоор дуртай дуу байхгүй байна.'),
                              if (controller.state.userLikedSongs.isNotEmpty)
                                SizedBox(
                                  height: 180,
                                  child: Obx(
                                    () => ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.state.userLikedSongs.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        dynamic track = controller.state.userLikedSongs[index];

                                        return Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: InkWell(onTap: () => Get.to(MusicPlayerScreen(track, false)), child: TopTrackItem(track)));
                                      },
                                    ),
                                  ),
                                )
                            ],
                          )
                        : const SizedBox(),
                    controller.state.user),
                const Text(
                  'Топ уран бүтээлчид',
                  style: TextStyle(
                    fontFamily: MyFonts.proDisplay,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: MyColors.colorWhite,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 180,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.state.topArtists.length,
                      itemBuilder: (BuildContext context, int index) {
                        dynamic artist = controller.state.topArtists[index];

                        return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: InkWell(
                                onTap: () async => {
                                      await controller.getArtistTopTracks(artist['name']),
                                      Get.to(ArtistMusicListScreen(
                                        artist: artist,
                                      ))
                                    },
                                child: TopArtistItem(artist)));
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(MusicListScreen(controller.state.topTracks, 'Топ дууны жагсаалт', false)),
                  child: const Text(
                    'Топ дууны жагсаалт >',
                    style: TextStyle(
                      fontFamily: MyFonts.proDisplay,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: MyColors.colorWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 180,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.state.topTracks.length > 6 ? 6 : controller.state.topTracks.length,
                      itemBuilder: (BuildContext context, int index) {
                        dynamic track = controller.state.topTracks[index];

                        return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: InkWell(onTap: () => Get.to(MusicPlayerScreen(track, false)), child: TopTrackItem(track)));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
