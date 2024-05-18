import 'package:get/get.dart';

class RegisterState {
  RxBool isEmailValid = true.obs;
  RxBool isPhoneNoValid = true.obs;
  final String apiKeyLastFm = "202127100faf64ce8e16b5d97b3fd855";
  final String apiSecretLastFm = "37a6335de15ca3a1d1a8c86b844c80da";
  var errorTitle = ''.obs;
  var errorMessage = ''.obs;
  var showErrorDialog = false.obs;

  var successTitle = ''.obs;
  var successMessage = ''.obs;
  var showSuccessDialog = false.obs;
}
