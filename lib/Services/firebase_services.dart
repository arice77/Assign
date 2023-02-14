import 'package:cashrich/Screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future signUp(String email, String password, BuildContext context) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (firebaseAuth.currentUser != null) {
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
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (firebaseAuth.currentUser != null) {
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
    await firebaseAuth.signOut();
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }
}
