import 'package:coinmarketcap/app/data/models/coins/coin.dart';
import 'package:coinmarketcap/app/modules/home/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstCoinList extends StatelessWidget {
  final HomePageController controller;
  const FirstCoinList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black87,
      color: const Color(0xFFF1FEFC),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              const Text(
                "Overview of the market",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              const Text("Show all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          controller.inProgress.value
              ? const Center(
                  child: SizedBox(
                  height: 30,
                  width: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                ))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: [
                        ...controller.coins
                            .map((e) => CoinCard(
                                  coin: e!,
                                ))
                            .toList()
                      ],
                    ),
                  ))
        ]),
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  final CoinDto coin;
  const CoinCard({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black87,
        color: const Color.fromARGB(255, 246, 243, 243),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/btc.jpg"),
                    radius: 15,
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      coin.quote!.uSD!.percentChange1h! >= 0
                          ? const Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 18,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 18,
                              color: Colors.red,
                            ),
                      coin.quote!.uSD!.percentChange1h! >= 0
                          ? Text(
                              coin.quote!.uSD!.percentChange1h!
                                  .toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.green),
                            )
                          : Text(
                              coin.quote!.uSD!.percentChange1h!
                                  .toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.red),
                            )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(coin.quote!.uSD!.price!.toStringAsFixed(2),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12))),
              const SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(coin.name!,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}
