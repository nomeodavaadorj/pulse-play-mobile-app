import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class TopArtistItem extends GetWidget<HomeController> {
  final dynamic artist;

  const TopArtistItem(this.artist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.network(
            artist['image'].last['#text'] ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjeIfQhfDbKYjAc0q26mdK_CZPOgSrfkrKQ7uNgR1vl_gUsxwz4tGEnphN3hHF9yaDUFY&usqp=CAU',
            height: 135,
            width: 135,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          artist['name'],
          style: const TextStyle(fontFamily: MyFonts.proDisplay, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
