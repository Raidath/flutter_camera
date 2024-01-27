import 'package:flutter/material.dart';

class TextScanner extends StatelessWidget {
  final String text;

  const TextScanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text("TEXTES TROUVES SUR LA PHOTO PRISE"),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Text(text),
        ),
      );
}
