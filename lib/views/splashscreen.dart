import 'package:flutter/material.dart';
import 'navBar.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Récupérez le délai d'affichage du splashscreen
    int duration = 2;
    Timer(Duration(seconds: duration), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 176, 39, 76),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/BUREAU2.jpg',
            width: 200,
            height: 500,
          ),
        ),
      ),
    );
  }
}
