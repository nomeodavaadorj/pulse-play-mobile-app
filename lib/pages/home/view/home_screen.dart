import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/components/playlist_item.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: BasicSearchBar(
                        height: screenWidth * 0.1,
                        width: screenWidth * 0.65,
                        controller: controller.searchBarController,
                      ),
                    ),
                    Container(
                        height: screenWidth * 0.13,
                        width: screenWidth * 0.13,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                        child: Image.asset('assets/icons/ic_avatar.png')),
                  ],
                ),
              ),
              const Text(
                'Миний тоглуулах жагсаалтууд',
                style: TextStyle(
                  fontFamily: MyFonts.proDisplay,
                  fontSize: 25,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
