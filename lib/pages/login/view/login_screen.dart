import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/text_field_widget.dart';
import 'package:pulse_play_mobile_app/pages/login/controller/login_controller.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset('assets/images/pp_logo.png'),
          const Text(
            'Тавтай морил',
            style: TextStyle(
              fontFamily: MyFonts.proDisplay,
              fontSize: 24,
            ),
          ),
          const Text(
            'Имейл, нууц үгээ оруулан нэвтэрнэ үү',
            style: TextStyle(
              fontFamily: MyFonts.proDisplay,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          TextFieldWidget(tfController: controller.emailController, icon: const Icon(Icons.email_outlined), hintText: 'Имейл'),
          TextFieldWidget(tfController: controller.passController, icon: const Icon(Icons.lock), hintText: 'Нууц үг'),
        ],
      ),
    );
  }
}
