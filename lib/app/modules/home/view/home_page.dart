import 'package:coinmarketcap/app/data/models/coins/coin.dart';
import 'package:coinmarketcap/app/modules/home/controllers/home_page_controller.dart';
import 'package:coinmarketcap/app/modules/home/view/first_coin_list_view.dart';
import 'package:coinmarketcap/app/modules/home/view/second_coin_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final HomePageController homePageController = Get.find();

@override
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    homePageController.getCurency();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body:
            homePageController.pages[homePageController.currentPageIndex.value],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.white,
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue))),
          child: NavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedIndex: homePageController.currentPageIndex.value,
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            height: 60,
            onDestinationSelected: (int newIndex) {
              homePageController.currentPageIndex.value = newIndex;
            },
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  icon: Icon(Icons.home_outlined),
                  label: "Home"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Typicons.chart_bar,
                    size: 20,
                    color: Colors.blue,
                  ),
                  icon: Icon(
                    Typicons.chart_bar_outline,
                    size: 20,
                  ),
                  label: "Currency"),
              NavigationDestination(
                  selectedIcon:
                      Icon(Linecons.wallet, size: 19, color: Colors.blue),
                  icon: Icon(
                    Linecons.wallet,
                    size: 19,
                  ),
                  label: "Wallet"),
              NavigationDestination(
                  selectedIcon: Icon(Icons.person, color: Colors.blue),
                  icon: Icon(Icons.person_outline),
                  label: "Account")
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageView extends GetView<HomePageController> {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.blue),
          title: const Text("CoinMarketCap"),
        ),
        body: FutureBuilder(
          future: controller.getCurency(),
          builder: (BuildContext context, AsyncSnapshot<List<CoinDto?>> data) {
            return controller.inProgress.value
                ? Center(
                    child: LoadingAnimationWidget.halfTriangleDot(
                        color: Colors.blue, size: 50),
                  )
                : controller.coins.length.isNaN
                    ? const Center(
                        child: Text(
                          "There is a problem in receiving information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: controller.onRefresh,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(children: [
                              FirstCoinList(
                                key: key,
                                controller: homePageController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 120,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 223, 220, 220)),
                                        ),
                                        child: const Center(
                                          child: Text("Trading Markets",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    // const SizedBox(width: 40,),
                                    SizedBox(
                                      height: 20,
                                      width: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 223, 220, 220)),
                                        ),
                                        child: const Center(
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    // const SizedBox(width: 30,),
                                    SizedBox(
                                      height: 20,
                                      width: 90,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 223, 220, 220)),
                                        ),
                                        child: const Center(
                                          child: Text("1 H changes",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.blue)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SecoundCoinList(
                                key: key,
                                controller: homePageController,
                              )
                            ])),
                      );
          },
        ));
  }
}
