import 'package:cashrich/Model/model.dart';
import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Screens/search_screen.dart';
import 'package:cashrich/Services/api_services.dart';
import 'package:cashrich/Services/firebase_services.dart';
import 'package:cashrich/Widgets/coin_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  bool isLoading = true;
  AuthService authService = AuthService();

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

  @override
  void initState() {
    super.initState();
    final coinRichData = Provider.of<DataProvide>(context, listen: false);
    coinRichData.initialize(null);
  }

  @override
  Widget build(BuildContext context) {
    final coinRichData = Provider.of<DataProvide>(context);
    isLoading = coinRichData.isLoading;
    if (!isLoading) {
      btc = coinRichData.data!.btc;
      usd = coinRichData.data!.usd;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.routeName);
        },
        backgroundColor: const Color.fromARGB(
          255,
          245,
          220,
          1,
        ),
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      backgroundColor: const Color.fromARGB(
        255,
        54,
        50,
        50,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                authService.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 1, 1, 100),
        title: const Text(
          'CoinRich',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: coinRichData.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(
                  255,
                  245,
                  220,
                  1,
                ),
              ),
            )
          : Column(
              children: [
                CoinContainer(btc: btc, usd: usd),
              ],
            ),
    );
  }
}
