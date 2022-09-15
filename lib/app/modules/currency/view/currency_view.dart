import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView>
    with SingleTickerProviderStateMixin {
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
        title: const Text("Currency"),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: const [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2)
                  ]),
              childrenDelegate: SliverChildBuilderDelegate(
                  childCount: 20, (context, index) => buildImageCard(index))),
          Center(child: Text("wallet2"))
        ],
      ),
    );
  }
}

Widget buildImageCard(int index) => Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black87,
      color: const Color(0xFFF1FEFC),
      child: Image.asset("images/btc.jpg"),
    );
