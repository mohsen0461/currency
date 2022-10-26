import 'package:coinmarketcap/app/data/models/coins/news.dart';
import 'package:coinmarketcap/app/data/providers/remote/news_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinmarketcap/app/data/models/coins/news_response.dart';

class CurrencyNewsController extends GetxController {
  final NewsApi newsAPI = NewsApi();

  RxBool inProgressNew = false.obs;

  RxList<NewsDto?> news = <NewsDto?>[].obs;

  Future<List<NewsDto?>> getNews() async {
    inProgressNew.value = true;
    try {
      NewsResponse newsResponse = await newsAPI.getNews();
      news.value = newsResponse.results!;

      // news.value = newsResponse.data!;

      inProgressNew.value = false;
    } catch (e) {
      Get.snackbar("eror", "dont fech news");
      debugPrint(e.toString());
    }
    inProgressNew.value = false;
    return news;
  }

  Future<void> onRefreshNews() async {
    inProgressNew.value = true;
    try {
      await getNews();
    } catch (e) {
      Get.snackbar("eror", "There is a problem in receiving information");
      debugPrint(e.toString());
    }
    inProgressNew.value = false;
    await Future.delayed(const Duration(milliseconds: 1000));
    
    
  }
}
