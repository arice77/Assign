import 'package:cashrich/Model/model.dart';
import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  bool isLoading = true;

  Btc btc = Btc(
    id: 0,
    name: '',
    symbol: '',
    slug: '',
    numMarketPairs: 0,
    dateAdded: DateTime.now(),
    tags: [],
    maxSupply: 0,
    circulatingSupply: 0,
    totalSupply: 0,
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
    coinRichData.initialize();
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
      backgroundColor: const Color.fromARGB(
        255,
        54,
        50,
        50,
      ),
      appBar: AppBar(
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            btc.name,
                            style: const TextStyle(
                                fontSize: 21,
                                color: Color.fromARGB(
                                  255,
                                  245,
                                  220,
                                  1,
                                ),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          usd.percentChange24H > 0
                              ? const Icon(
                                  Icons.arrow_drop_up_sharp,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.red,
                                ),
                          Text(
                            '${usd.percentChange24H.toStringAsFixed(2)}%',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 19),
                              color: const Color.fromARGB(
                                255,
                                49,
                                49,
                                48,
                              ),
                              child: Text(
                                btc.symbol,
                                style: const TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Price   \$ ${usd.price.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                          Text(
                            'Rank     ${btc.cmcRank}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Color.fromARGB(255, 250, 226, 1),
                            size: 34,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
