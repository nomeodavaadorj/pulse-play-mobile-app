import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/text_field_widget.dart';
import 'package:pulse_play_mobile_app/pages/login/controller/login_controller.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Container(
        height: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset('assets/images/pp_logo.png'),
                SizedBox(
                  height: 20,
                ),
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
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    tfController: controller.emailController,
                    icon: const Icon(Icons.email_outlined),
                    hintText: 'Имейл'),
                const SizedBox(height: 20),
                TextFieldWidget(
                    tfController: controller.passController,
                    icon: const Icon(Icons.lock),
                    hintText: 'Нууц үг'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text("Remember me", style: TextStyle(fontSize: 12),),
                      ],
                    ),
                    Text("Forget password ?", style: TextStyle(fontSize: 10, color: MyColors.buttonColor),),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: MyColors.buttonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: const Text('Нэвтрэх >', style: TextStyle(fontSize: 18,),)),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("New member? "), Text("Register now", style: TextStyle(color: MyColors.buttonColor),)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
