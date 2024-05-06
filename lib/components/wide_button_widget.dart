import 'package:flutter/material.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class WideButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Icon icon;
  const WideButtonWidget({super.key, required this.text, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () {
          onPressed;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            icon
          ],
        ));
  }
}
