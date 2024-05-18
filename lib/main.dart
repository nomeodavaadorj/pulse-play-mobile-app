import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/route/my_pages.dart';
import 'package:pulse_play_mobile_app/route/my_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Start app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      initialRoute: MyRoutes.home,
      themeMode: ThemeMode.system,
      getPages: MyPages.pages,

      // themeMode: ThemeMode.system,
    );
  }
}
