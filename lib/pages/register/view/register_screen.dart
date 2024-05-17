import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import '../../../components/auto_close_dialog.dart';
import '../../../components/show_alert_dialog.dart';
import '../../../components/text_field_widget.dart';
import '../../../utils/my_colors.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
            child: Column(children: [
              const SizedBox(height: 60),
              Image.asset('assets/images/pp_logo.png'),
              const SizedBox(height: 30),
              const Text(
                'Бүртгүүлэх',
                style: TextStyle(fontFamily: MyFonts.proDisplay, fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Дараах талбаруудыг бөглөн бүртгэлээ үүсгэнэ үү.',
                style: TextStyle(
                  fontFamily: MyFonts.proDisplay,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                tfController: controller.nameController,
                icon: const Icon(Icons.person_outline_rounded),
                hintText: 'Нэвтрэх нэр',
                isErrorOccured: false,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                tfController: controller.emailController,
                icon: const Icon(Icons.email_outlined),
                hintText: 'Имейл',
                isErrorOccured: !controller.state.isEmailValid.value,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                tfController: controller.phoneController,
                icon: const Icon(Icons.phone_iphone_rounded),
                hintText: 'Утасны дугаар',
                isErrorOccured: !controller.state.isPhoneNoValid.value,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                tfController: controller.passController,
                icon: const Icon(Icons.lock),
                hintText: 'Нууц үг',
                isErrorOccured: false,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.buttonColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: () => controller.handleRegistration(context),
                  child: const Text(
                    'Бүртгүүлэх >',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: MyFonts.proDisplay),
                  ),
                ),
              ),
              Obx(() {
                if (controller.state.showErrorDialog.isTrue) {
                  Future.delayed(Duration.zero, () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => ShowAlertDialog(
                        onTap: () {
                          Get.back();
                          controller.state.showErrorDialog.value = false;
                        },
                        title: controller.state.errorTitle.value,
                        onTapText: 'За',
                        subtitle: controller.state.errorMessage.value,
                      ),
                    );
                  });
                }
                if (controller.state.showSuccessDialog.isTrue) {
                  Future.delayed(Duration.zero, () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AutoCloseDialog(
                        title: controller.state.successTitle.value,
                        content: controller.state.successMessage.value,
                      ),
                    );
                  });
                  Get.toNamed('/home');
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Бүртгэлтэй юу?",
                    style: TextStyle(fontSize: 13, fontFamily: MyFonts.proDisplay, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/login'),
                    child: const Text(
                      "Нэвтрэх",
                      style: TextStyle(color: MyColors.buttonColor, fontWeight: FontWeight.w600, fontFamily: MyFonts.proDisplay, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
