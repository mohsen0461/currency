import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("this is a message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}

Future main() async {
  // for firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isAuth = FirebaseAuth.instance.currentUser != null ? true : false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: isAuth ? Routes.HOME : Routes.LOGIN,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
