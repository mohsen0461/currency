import 'dart:convert';

import 'package:coinmarketcap/app/data/models/coins/coin_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CoinsApi {
  final Uri coinMarketCapURL = Uri.http("pro-api.coinmarketcap.com",
      "/v1/cryptocurrency/listings/latest", {"limit": "20"});

  Future<CoinResponse> getCurrencies() async {
    Map<String, String> headers = {
      "X-CMC_PRO_API_KEY": "2c7d46ae-900c-4abb-ac35-32f8e3bff4d8"
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
}
