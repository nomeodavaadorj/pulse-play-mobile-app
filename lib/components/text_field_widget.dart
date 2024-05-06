import 'package:flutter/material.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController tfController;
  final Icon icon;
  final String hintText;
  const TextFieldWidget({super.key, required this.tfController, required this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
            labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          controller: tfController,
        ),
      ),
    );
  }
}
