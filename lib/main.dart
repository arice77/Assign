import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvide(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CoinRich',
        home: HomeScreen(),
      ),
    );
  }
}
