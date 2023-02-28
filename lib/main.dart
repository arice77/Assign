import 'package:cashrich/Provider/data_provider.dart';
import 'package:cashrich/Screens/auth_screen.dart';
import 'package:cashrich/Screens/home_screen.dart';
import 'package:cashrich/Screens/search_screen.dart';
import 'package:cashrich/Services/firebase_services.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool isLoggedin = await AuthService().loginStatus();
  runApp(MyApp(
    isLogin: isLoggedin,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  bool isLogin;
  MyApp({super.key, required this.isLogin});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvide(),
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) =>
              const HomeScreen(isInitailized: false),
          SearchScreen.routeName: (context) => const SearchScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'CoinRich',
        home: widget.isLogin
            ? const HomeScreen(
                isInitailized: false,
              )
            : const AuthScreen(),
      ),
    );
  }
}
