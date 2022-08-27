import 'package:coinmarketcap/app/modules/home/bindings/home_page_bindings.dart';
import 'package:coinmarketcap/app/modules/home/view/home_page.dart';
import 'package:coinmarketcap/app/modules/account/view/account_view.dart';
import 'package:coinmarketcap/app/modules/wallet/view/wallet.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
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
