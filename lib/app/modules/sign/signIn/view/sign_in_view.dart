import 'package:coinmarketcap/app//utils/color_utils.dart';
import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:coinmarketcap/app/widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: [
              Image.asset(
                "images/login.png",
                fit: BoxFit.fitWidth,
                width: 240,
                height: 240,
              ),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter UserName", Icons.person_outline,
                  emailTextController, false),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline,
                  passwordTextController, true),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text)
                    .then((value) {
                  debugPrint("Log in with email and password");
                  Get.toNamed(Routes.HOME);
                }).onError((error, stackTrace) {
                  debugPrint("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
