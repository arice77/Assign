import 'package:cashrich/Model/model.dart';
import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Screens/home_screen.dart';
import 'package:cashrich/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();
  bool isLoading = true;
  bool load = false;

  Btc btc = Btc(
    id: 0,
    name: '',
    symbol: '',
    slug: '',
    numMarketPairs: 0,
    dateAdded: DateTime.now(),
    tags: [],
    isActive: 0,
    cmcRank: 0,
    isFiat: 0,
    lastUpdated: DateTime.now(),
  );
  Usd usd = Usd(
      price: 0,
      volume24H: 0,
      volumeChange24H: 0,
      percentChange1H: 0,
      percentChange24H: 0,
      percentChange7D: 0,
      percentChange30D: 0,
      percentChange60D: 0,
      percentChange90D: 0,
      marketCap: 0,
      marketCapDominance: 0,
      fullyDilutedMarketCap: 0,
      lastUpdated: DateTime.now());

  void search(String? search) {
    final coinRichData = Provider.of<DataProvide>(context, listen: false);

    coinRichData.initialize(search);
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coinRichData = Provider.of<DataProvide>(
      context,
    );
    isLoading = coinRichData.isLoading;
    if (!isLoading) {
      btc = coinRichData.data!.btc;
      usd = coinRichData.data!.usd;
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        54,
        50,
        50,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.yellow)),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    onSubmitted: (value) {
                      search(value);
                    },
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.yellow,
                    decoration: const InputDecoration(border: InputBorder.none),
                  )),
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      search(searchController.text);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
