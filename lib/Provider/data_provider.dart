import 'package:cashrich/Model/model.dart';
import 'package:cashrich/Services/api_services.dart';
import 'package:flutter/material.dart';

class DataProvide extends ChangeNotifier {
  CoinRichData? data;

  bool isLoading = false;

  initialize(String? search) async {
    isLoading = true;
    data = await ApiService().getData(search);
    isLoading = false;
    notifyListeners();
  }
}
