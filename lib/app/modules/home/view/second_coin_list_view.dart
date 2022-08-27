import 'package:coinmarketcap/app/data/models/coins/coin.dart';
import 'package:coinmarketcap/app/modules/home/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecoundCoinList extends StatelessWidget {
  final HomePageController controller;
  const SecoundCoinList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: controller.coins.length,
          itemBuilder: (BuildContext context, int index) {
            return CoinList(
              key: key,
              coin: controller.coins[index],
            );
          }),
    );
  }
}

class CoinList extends StatelessWidget {
  final CoinDto? coin;
  const CoinList({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black87,
        color: const Color(0xFFF1FEFC),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("images/btc.jpg"),
                radius: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(coin!.symbol!,style: const TextStyle(fontWeight: FontWeight.bold),),
              Expanded(child: Container()),
              Text(coin!.quote!.uSD!.price!.toStringAsFixed(2),style: const TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Container()),
              coin!.quote!.uSD!.percentChange1h! >= 0
                  ? Text(
                      coin!.quote!.uSD!.percentChange1h!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 12, color: Colors.green),
                    )
                  : Text(
                      coin!.quote!.uSD!.percentChange1h!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 12, color: Colors.red),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
