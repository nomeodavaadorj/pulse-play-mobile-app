import 'package:flutter/material.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController tfController;
  final Icon icon;
  final String hintText;
  final bool isErrorOccured;
  const TextFieldWidget({super.key, required this.tfController, required this.icon, required this.hintText, required this.isErrorOccured});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: icon,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: isErrorOccured ? Colors.red : const Color(0xff515151)),
            labelStyle: TextStyle(fontSize: 14, color: isErrorOccured ? Colors.red : const Color(0xff9a9a9a)),
          ),
          controller: tfController,
        ),
      ),
    );
  }
}
