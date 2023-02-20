import 'package:cashrich/Screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String login = 'loginStatus';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future signUp(String email, String password, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (firebaseAuth.currentUser != null) {
        await pref.setBool(login, true);
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    } catch (e) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }

  Future logIn(String email, String password, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (firebaseAuth.currentUser != null) {
        pref.setBool(login, true);
        return true;
      }
    } on FirebaseException catch (e) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    } catch (e) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }

  signOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await firebaseAuth.signOut();
    pref.setBool(login, false);
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  Future<bool> loginStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(login) ?? false;
  }
}
