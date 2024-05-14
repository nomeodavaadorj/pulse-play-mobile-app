import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/text_field_widget.dart';
import '../../../components/wide_button_widget.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Бүртгүүлэх'),
          const Text('Өөрийн бүртгэлийг үнэгүй үүсгээрэй.'),
          TextFieldWidget(tfController: controller.nameController, icon: const Icon(Icons.person), hintText: 'Full name'),
          TextFieldWidget(tfController: controller.emailController, icon: const Icon(Icons.mail), hintText: 'Valid email'),
          TextFieldWidget(tfController: controller.phoneController, icon: const Icon(Icons.phone), hintText: 'Phone number'),
          TextFieldWidget(tfController: controller.passController, icon: const Icon(Icons.lock), hintText: 'Strong password'),
          const Spacer(),
          WideButtonWidget(text: 'Бүртгүүлэх', onPressed: () {}, icon: const Icon(Icons.arrow_right)),
          Row(
            children: [
              const Text('Бүртгэлтэй юу?'),
              TextButton(
                onPressed: () {},
                child: const Text('Нэвтрэх'),
              )
            ],
          )
        ],
      ),
    );
  }
}
