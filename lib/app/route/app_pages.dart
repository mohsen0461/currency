import 'package:coinmarketcap/app/modules/home/bindings/home_page_bindings.dart';
import 'package:coinmarketcap/app/modules/home/view/home_page.dart';
import 'package:coinmarketcap/app/modules/account/view/account_view.dart';
import 'package:coinmarketcap/app/modules/sign/signIn/view/sign_in_view.dart';
import 'package:coinmarketcap/app/modules/sign/sign_up/view/sign_up_view.dart';
import 'package:coinmarketcap/app/modules/wallet/view/wallet.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => SignInView(),
    ),

    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
    ),

    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomePageBindings()),

    GetPage(
      name: Routes.PERSON,
      page: () => const AccountView(),
    ),
    GetPage(
      name: Routes.PERSONWALLET,
      page: () => const Wallet(),
    ),
  ];
}
