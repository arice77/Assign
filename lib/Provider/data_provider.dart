import 'package:cashrich/Model/model.dart';
import 'package:cashrich/Services/api_services.dart';
import 'package:flutter/material.dart';

class DataProvide extends ChangeNotifier {
  CoinRichData? data;

  bool isLoading = false;
  initialize() async {
    isLoading = true;
    data = await ApiService().getData();
    isLoading = false;
    notifyListeners();
  }
}
