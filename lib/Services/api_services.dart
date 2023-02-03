import 'dart:convert';

import 'package:cashrich/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<CoinRichData?> getData() async {
    try {
      String apiKey = "27ab17d1-215f-49e5-9ca4-afd48810c149";
      var url = Uri.parse(
          'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC');
      http.Response res =
          await http.get(url, headers: {"X-CMC_PRO_API_KEY": apiKey});
      Btc btc = Btc.fromJson(jsonDecode(res.body)['data']['BTC']);
      Usd usd =
          Usd.fromJson(jsonDecode(res.body)['data']['BTC']['quote']['USD']);

      return CoinRichData(btc: btc, usd: usd);
    } catch (e) {
      debugPrint('Something went wrong');
    }
    return null;
  }
}
