import 'package:coinmarketcap/app/modules/account/controller/account_controller.dart';
import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:coinmarketcap/app/utils/theme/controller/theme_controller.dart';
import 'package:coinmarketcap/app/utils/theme/view/theme_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class AccountView extends GetView<AccountController> {
  AccountView({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
          centerTitle: true,
          leading: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (Get.isDarkMode) {
                themeController.changeThemeMode(ThemeMode.light);
                themeController.saveTheme(false);
                themeController.isDark.value = false;
              } else {
                themeController.changeThemeMode(ThemeMode.dark);
                themeController.saveTheme(true);
                themeController.isDark.value = true;
              }
            },
            child: Obx(
              () => themeController.isDark.value
                  ? const Icon(
                      Icons.wb_sunny_sharp,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.black87,
                    ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black87,
                // color: const Color(0xFFF1FEFC),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          FirebaseAuth.instance.currentUser!.email!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListTile(
                        leading: Icon(
                          LineariconsFree.diamond_1,
                          size: 20,
                          color: Colors.blue,
                        ),
                        title: Text("Account Level",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        trailing: Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black87,
                // color: const Color(0xFFF1FEFC),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.blue,
                      ),
                      title: Text("User Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Linecons.lock,
                        color: Colors.blue,
                        size: 20,
                      ),
                      title: Text("Security",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications_rounded,
                        color: Colors.blue,
                        size: 20,
                      ),
                      title: Text("Notificatio",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesome5.user_friends,
                        color: Colors.blue,
                        size: 17,
                      ),
                      title: Text("Invite Friends",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesome5.cog,
                        color: Colors.blue,
                        size: 17,
                      ),
                      title: Text("Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black87,
                // color: const Color(0xFFF1FEFC),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Elusive.headphones,
                        color: Colors.blue,
                        size: 17,
                      ),
                      title: Text("Support And Guidance",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesome.chat_empty,
                        color: Colors.blue,
                        size: 20,
                      ),
                      title: Text("Chat with support",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    debugPrint("Signed Out");
                    Get.offAndToNamed(Routes.LOGIN);
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black87,
                  // color: const Color(0xFFF1FEFC),
                  child: const ListTile(
                    leading: Icon(
                      FontAwesome.logout,
                      color: Colors.blue,
                      size: 20,
                    ),
                    title: Text("Sign Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
