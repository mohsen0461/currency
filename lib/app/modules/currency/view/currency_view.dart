import 'package:coinmarketcap/app/data/models/coins/news.dart';
import 'package:coinmarketcap/app/modules/currency/controller/currency_news_controller.dart';
import 'package:coinmarketcap/app/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

final CurrencyNewsController controller = CurrencyNewsController();

class _CurrencyViewState extends State<CurrencyView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    controller.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: TabBar(
            controller: tabController,
            indicatorWeight: 1.5,
            // labelColor: Colors.blue,
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
          FutureBuilder(
              future: controller.getNews(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<NewsDto?>> data) {
                switch (data.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: LoadingAnimationWidget.halfTriangleDot(
                          color: Colors.blue, size: 50),
                    );
                  default:
                    if (data.hasError) {
                      return const Center(
                        child: Text(
                          "There is a Problem In Receiving News",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: controller.onRefreshNews,
                        child: GridView.custom(
                            gridDelegate: SliverQuiltedGridDelegate(
                                crossAxisCount: 4,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                repeatPattern:
                                    QuiltedGridRepeatPattern.inverted,
                                pattern: const [
                                  QuiltedGridTile(2, 2),
                                  QuiltedGridTile(1, 1),
                                  QuiltedGridTile(1, 1),
                                  QuiltedGridTile(1, 2)
                                ]),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: controller.news.length,
                                (context, index) => InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.CURRENCYNEWS,
                                            arguments: {
                                              "imageUrl": controller
                                                  .news[index]!.imageUrl,
                                              "title":
                                                  controller.news[index]!.title,
                                              "description": controller
                                                  .news[index]!.description,
                                              "content": controller
                                                  .news[index]!.content
                                            });
                                      },
                                      child: buildImageCard(
                                          index, controller.news[index]!),
                                    ))),
                      );
                    }
                }
              }),
          Center(child: Text("wallet2"))
        ],
      ),
    );
  }
}

Widget buildImageCard(int index, NewsDto newsDto) => Card(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10)),
    shadowColor: Colors.black87,
    // color: const Color(0xFFF1FEFC),
    child: Container(
      margin: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: newsDto.imageUrl == null
            ? Image.asset("images/no-image.png")
            : Image.network(newsDto.imageUrl!, fit: BoxFit.cover, errorBuilder:
                (BuildContext context, Object object, StackTrace? stackTrace) {
                return Image.asset("images/no-image.png");
              }),
      ),
    ));
