import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/route/my_pages.dart';
import 'package:pulse_play_mobile_app/route/my_routes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

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
