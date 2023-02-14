import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Screens/auth_screen.dart';
import 'package:cashrich/Screens/home_screen.dart';
import 'package:cashrich/Screens/search_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvide(),
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'CoinRich',
        home: const AuthScreen(),
      ),
    );
  }
}
