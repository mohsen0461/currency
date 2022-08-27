import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        bottom: TabBar(
            controller: tabController,
            indicatorWeight: 1.5,
            labelColor: Colors.blue,
            tabs: const [
              Tab(
                text: "بازار های معاملاتی ",
              ),
              Tab(
                text: "خرید و فروش آنی",
              )
            ]),
        title: const Text("wallet"),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("wallet1")),
          Center(child: Text("wallet2"))
        ],
      ),
    );
  }
}
