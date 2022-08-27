import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:coinmarketcap/app/utils/color_utils.dart';
import 'package:coinmarketcap/app/widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("C82893"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter UserName", Icons.person_outline,
                  userNameTextController, false),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email Id", Icons.person_outline,
                  emailTextController, false),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline,
                  passwordTextController, true),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text)
                    .then((value) {
                  debugPrint("Created New Account");
                  Get.toNamed(Routes.HOME);
                }).onError((error, stackTrace) {
                  debugPrint("Error ${error.toString()}");
                });
              })
            ]),
          ),
        ));
  }
}
