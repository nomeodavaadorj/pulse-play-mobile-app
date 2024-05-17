import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/components/text_field_widget.dart';
import 'package:pulse_play_mobile_app/pages/login/controller/login_controller.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import 'package:pulse_play_mobile_app/utils/my_colors.dart';

import '../../../components/success_dialog_widget.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset('assets/images/pp_logo.png'),
                const SizedBox(
                  height: 40,
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
                  hintText: 'Имейл',
                  isErrorOccured: false,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  tfController: controller.passController,
                  icon: const Icon(Icons.lock),
                  hintText: 'Нууц үг',
                  isErrorOccured: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                              value: controller.state.isRememberMeChecked.value,
                              onChanged: (value) {
                                controller.state.isRememberMeChecked.value = !controller.state.isRememberMeChecked.value;
                              }),
                        ),
                        const Text(
                          "Намайг сана",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const Text(
                      "Нууц үгээ марсан уу?",
                      style: TextStyle(fontSize: 10, color: MyColors.buttonColor),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
                      backgroundColor: MyColors.buttonColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    bool success = await controller.signIn();
                    if (success) {
                      Get.toNamed('/home');
                    } else {
                      Get.dialog(const SuccessDialogWidget(
                        title: 'Амжилтгүй\n Имейл эсвэл нууц үгээ шалгаад дахин оролдоно уу',
                      ));
                    }
                  },
                  child: const Text(
                    'Нэвтрэх >',
                    style: TextStyle(fontSize: 18, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Шинэ хэрэглэгч үү? ",
                      style: TextStyle(fontSize: 13, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/register'),
                      child: const Text(
                        "Бүртгүүлэх",
                        style: TextStyle(color: MyColors.buttonColor, fontSize: 13, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
