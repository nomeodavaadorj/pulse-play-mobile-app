import 'package:flutter/material.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import '../utils/my_colors.dart';

class BasicSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final double width;
  final Function() onChanged;

  const BasicSearchBar({super.key, required this.controller, required this.height, required this.width, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide.none),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Хайх",
              filled: true,
              fillColor: MyColors.colorWhite,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.hintTextColor,
                fontFamily: MyFonts.proDisplay,
              )),
          onChanged: onChanged(),
          style: const TextStyle(color: Colors.black),
          controller: controller),
    );
  }
}
