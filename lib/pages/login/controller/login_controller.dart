import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/login/state/login_state.dart';

class LoginController extends GetxController {
  final state = LoginState();
  final _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<bool> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passController.text.trim());
      return true;
    } catch (_) {
      return false;
    }
  }
}
