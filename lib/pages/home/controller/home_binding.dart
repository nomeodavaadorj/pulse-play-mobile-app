import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
