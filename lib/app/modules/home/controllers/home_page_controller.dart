import 'package:coinmarketcap/app/data/models/coins/coin.dart';
import 'package:coinmarketcap/app/data/models/coins/coin_response.dart';
import 'package:coinmarketcap/app/data/providers/remote/coins_api.dart';
import 'package:coinmarketcap/app/modules/currency/view/currency_view.dart';
import 'package:coinmarketcap/app/modules/home/view/home_page.dart';
import 'package:coinmarketcap/app/modules/account/view/account_view.dart';
import 'package:coinmarketcap/app/modules/wallet/view/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final CoinsApi coinsApi = CoinsApi();
  RxBool inProgress = false.obs;

  List<Widget> pages = const [
    HomePageView(),
    CurrencyView(),
    Wallet(),
    AccountView(),
  ];

  RxInt currentPageIndex = 0.obs;

  RxList<CoinDto?> coins = <CoinDto>[].obs;

  RxString notificationsMsg = "".obs;

  Future<List<CoinDto?>> getCurency() async {
    inProgress.value = true;

    try {
      CoinResponse coinResponse = await coinsApi.getCurrencies();

      coins.value = coinResponse.data!;

      inProgress.value = false;
    } catch (e) {
      Get.snackbar("eror", "dont fech data");
      debugPrint(e.toString());
    }

    inProgress.value = false;
    return coins;
  }

  Future<void> onRefresh() async {
    try {
      await getCurency();
    } catch (e) {
      Get.snackbar("eror", "There is a problem in receiving information");
      debugPrint(e.toString());
    }
  }
}
