import 'package:cashrich/Screens/home_screen.dart';
import 'package:cashrich/Services/firebase_services.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static String routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passControler = TextEditingController();
  final UniqueKey _email = UniqueKey();
  final UniqueKey _pass = UniqueKey();
  final _formKey = GlobalKey<FormState>();
  var result;
  final AuthService _authService = AuthService();
  bool isLoading = false;

  bool _isSignUp = false;
  @override
  void dispose() {
    super.dispose();
    _emailControler.dispose();
    _passControler.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      if (_isSignUp) {
        result = await _authService.signUp(
            _emailControler.text, _passControler.text, context);
      } else {
        result = await _authService.logIn(
            _emailControler.text, _passControler.text, context);
      }
      if (result == true) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        54,
        50,
        50,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be null';
                    }
                    return null;
                  },
                  key: _email,
                  controller: _emailControler,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 2.0,
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder())),
              TextFormField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password caannot be null';
                  }
                  return null;
                },
                key: _pass,
                controller: _passControler,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                    )),
              ),
              isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.yellow,
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow)),
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        _isSignUp ? 'Sign Up' : 'Login',
                        style: const TextStyle(color: Colors.black),
                      )),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      _isSignUp
                          ? 'Already have an account?'
                          : "Don't have an account?",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isSignUp = !_isSignUp;
                          });
                        },
                        child: Text(
                          _isSignUp ? 'Login' : 'Sign Up',
                          style: const TextStyle(color: Colors.yellow),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
