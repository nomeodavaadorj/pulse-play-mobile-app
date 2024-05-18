import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class ShowAlertDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final String onTapText;

  const ShowAlertDialog({super.key, required this.onTap, required this.title, required this.onTapText, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700, color: MyColors.colorWhite, fontSize: 22),
      ),
      content: Text(subtitle),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Болих',
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: Text(
            onTapText,
            style: const TextStyle(fontSize: 14, color: Colors.greenAccent),
          ),
          onPressed: () {
            onTap();
          },
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
