import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  FirebaseAuth firebaseAuth = Modular.get();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      if (firebaseAuth.currentUser != null) {
        Modular.to.navigate("/home/");
      } else {
        Modular.to.navigate("/auth/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Hero(
          tag: "logo",
          child: Image.asset(
            'assets/images/marvel_logo.png',
          ),
        ),
      )),
    );
  }
}
