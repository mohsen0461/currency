import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:coinmarketcap/app/utils/theme/controller/theme_controller.dart';
import 'package:coinmarketcap/app/utils/theme/view/theme_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("this is a message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}

Future main() async {
  // for local storage
  await GetStorage.init();
  // for firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isAuth = FirebaseAuth.instance.currentUser != null ? true : false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeController.theme,
      theme: CurrencyThemes.lightTheme,
      darkTheme: CurrencyThemes.darkTheme,
      getPages: AppPages.routes,
      initialRoute: isAuth ? Routes.HOME : Routes.LOGIN,
    );
  }
}
