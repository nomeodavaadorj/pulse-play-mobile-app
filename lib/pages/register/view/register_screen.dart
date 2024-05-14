import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/style/my_fonts.dart';
import '../../../components/text_field_widget.dart';
import '../../../utils/my_colors.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,  // Add this line
      body: SingleChildScrollView(  // Wrap the body in SingleChildScrollView
        child: Container(
          height: MediaQuery.of(context).size.height,  // Adjust height to use MediaQuery
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/pp_logo.png'),
                  SizedBox(height: 20),
                  const Text(
                    'Та бүртгэлээ үүсгэнэ үү',
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
                      tfController: controller.passController,
                      icon: const Icon(Icons.person_outline_rounded),
                      hintText: 'Нэвтрэх нэр'),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                      tfController: controller.emailController,
                      icon: const Icon(Icons.email_outlined),
                      hintText: 'Имейл'),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                      tfController: controller.passController,
                      icon: const Icon(Icons.phone_iphone_rounded),
                      hintText: 'Утасны дугаар'),
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
                          Text(
                            "Remember me",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        "Forget password ?",
                        style: TextStyle(
                            fontSize: 10, color: MyColors.buttonColor),
                      ),
                    ],
                  ),
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
                    child: Center(
                      child: const Text(
                        'Нэвтрэх >',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member? "),
                      Text(
                        "Log In",
                        style: TextStyle(color: MyColors.buttonColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
