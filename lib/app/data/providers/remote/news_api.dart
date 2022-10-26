import 'dart:convert';

import 'package:coinmarketcap/app/data/models/coins/news_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class NewsAPI {
//   // https://www.marketaux.com/
//   static Uri newsUrl = Uri.http("api.marketaux.com", "/v1/news/all",
//       {"api_token": "WrF72qUNmhKj8GpcO5DcbRpj3uQnCunZHuVwfoSa"});

//   Map<String, String> headers = {
//     "api_token": "WrF72qUNmhKj8GpcO5DcbRpj3uQnCunZHuVwfoSa"
//   };

//   Future<NewsResponse> getNews() async {
//     http.Response response = await http.get(newsUrl, headers: headers);
//     debugPrint(response.body.toString());
//     debugPrint(response.statusCode.toString());
//     if (response.statusCode == 200) {
//       Map<String, dynamic> decoeJson = jsonDecode(response.body);

//       // Map<String, dynamic> allMap = {};
//       // for (var map in decoeJson) {
//       //   allMap = {
//       //     "id": map["id"],
//       //     "title": map["title"],
//       //     "date": map["date"],
//       //     "description": map["description"],
//       //     "country": map["country"],
//       //     "category": map["category"],
//       //     "symbol": map["symbol"],
//       //     "url": map["url"]
//       //   };
//       // }
//       return NewsResponse.fromJson(decoeJson);
//     } else {
//       throw Exception("Failed to connect to News API");
//     }
//   }
// }

class NewsApi {
  static Uri newsUrl = Uri.http("newsdata.io", "/api/1/news", {
    "country": "cn,us,tr,gb",
    "category": "business,politics,technology,world,top",
    "language": "en,tr"
  });

  Map<String, String> headers = {
    "X-ACCESS-KEY": "pub_114522ce66c901a922f8993f5197f63067fbf"
  };

  Future<NewsResponse> getNews() async {
    http.Response response = await http.get(newsUrl, headers: headers);
    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> decoeJson = jsonDecode(response.body);
      debugPrint(decoeJson.toString());

      return NewsResponse.fromJson(decoeJson);
    } else {
      throw Exception("Failed to connect to News API");
    }
  }
}
