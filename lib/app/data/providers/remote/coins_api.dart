import 'dart:async';
import 'dart:convert';

import 'package:coinmarketcap/app/data/models/coins/coin_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CoinsApi {
  static Uri coinMarketCapURL = Uri.http("pro-api.coinmarketcap.com",
      "/v1/cryptocurrency/listings/latest", {"limit": "20"});

  //  Stream<CoinResponse> getCurrenciesStream() =>
  //     Stream.periodic(const Duration(minutes: 1))
  //         .asyncMap((event) => getCurrencies());

   Future<CoinResponse> getCurrencies() async {
    Map<String, String> headers = {
      "X-CMC_PRO_API_KEY": "2d5ca8de-ef35-467f-b482-d5768e2544b6"
    };
    http.Response response = await http.get(coinMarketCapURL, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> bodymap = jsonDecode(response.body);
      debugPrint(bodymap.toString());

      return CoinResponse.fromJson(bodymap);
    } else {
      throw Exception("Failed to connect to API");
    }
  }

  // Stream<CoinResponse> getCurrenciesStream() async* {
  //   Map<String, String> headers = {
  //     "X-CMC_PRO_API_KEY": "2c7d46ae-900c-4abb-ac35-32f8e3bff4d8"
  //   };
  //   http.Response response = await http.get(coinMarketCapURL, headers: headers);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> bodymap = jsonDecode(response.body);
  //     debugPrint(bodymap.toString());

  //     CoinResponse coinResponseModel = CoinResponse.fromJson(bodymap);
  //    streamController.sink.add(coinResponseModel);

  //   } else {
  //     throw Exception("Failed to connect to API");
  //   }
  // }
}
