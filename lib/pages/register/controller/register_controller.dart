import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/register/state/register_state.dart';
import 'package:pulse_play_mobile_app/pages/register/view/register_screen.dart';

import '../../home/view/home_screen.dart';
import '../../login/view/login_screen.dart';

class RegisterController extends GetxController {
  final state = RegisterState();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Dio dio = Dio();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (callback) => _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const RegisterScreen()) : Get.offAll(() => const HomeScreen());
  }

  bool isValidPhoneNumber(String value) {
    return value.trim().length == 8 && int.tryParse(value.trim()) != null;
  }

  bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()\[\]\\.,;:\s@\"]+(\.[^<>()\[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    return regex.hasMatch(email);
  }

  Future<void> handleRegistration(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passController.text.trim();
    String name = nameController.text.trim();
    String phoneNumber = phoneController.text.trim();

    if (!isValidEmail(email)) {
      state.errorTitle.value = 'Имейл буруу байна';
      state.errorMessage.value = 'Зөв имейл оруулна уу';
      state.showErrorDialog.value = true;
      return;
    }

    if (!isValidPhoneNumber(phoneNumber)) {
      state.errorTitle.value = 'Утасны дугаар буруу байна';
      state.errorMessage.value = 'Зөв дугаар оруулна уу';
      state.showErrorDialog.value = true;
      return;
    }

    bool success = await registerEmailAndPassword(email, password, name, phoneNumber);
    if (success) {
      state.successTitle.value = 'Амжилттай';
      state.successMessage.value = 'Таны бүртгэл амжилттай үүслээ.';
      state.showSuccessDialog.value = true;
    } else {
      state.errorTitle.value = 'Амжилтгүй';
      state.errorMessage.value = 'Амжилтгүй, та дахин оролдоно уу.';
      state.showErrorDialog.value = true;
    }
  }

  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log('Firebase auth exception: ${e.message}');
      return null;
    } catch (e) {
      log('General exception: $e');
      return null;
    }
  }

  Future<void> initializeUserData(User user, String name, String phoneNumber, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'name': name,
      'phone': phoneNumber,
      'email': email,
      'joinedAt': FieldValue.serverTimestamp(),
    });

    await FirebaseFirestore.instance.collection('playlists').doc(user.uid).set({'tracks': [], 'name': '', 'img': ''});
    await FirebaseFirestore.instance.collection('liked').doc(user.uid).set({
      'tracks': [],
    });
  }

  Future<bool> registerEmailAndPassword(String email, String password, String name, String phoneNumber) async {
    User? user = await registerUser(email, password);
    if (user != null) {
      await initializeUserData(user, name, phoneNumber, email);
      Get.offAll(() => const HomeScreen());
      return true;
    } else {
      Get.to(() => const LoginScreen());
      return false;
    }
  }

// Future<String> authenticateLastFm() async {
  //   // Step 1: Request token
  //   final responseToken = await dio.get(
  //     'http://ws.audioscrobbler.com/2.0/?method=auth.gettoken&api_key=${state.apiKeyLastFm}.&format=json',
  //   );
  //   String token = responseToken.data['token'];
  //
  //   // Step 2: Redirect user to approve app
  //   Get.to(() => WebViewCon(authUrl: 'http://www.last.fm/api/auth/?api_key=${state.apiKeyLastFm}&token=$token'));
  //
  //   // Token should be exchanged for a session key after user approval
  //   return token; // You need to handle the session key after user redirects back
  // }
}
