import 'dart:io';
import 'package:extract_text_picture/views/textScanner.dart';
import 'package:flutter/material.dart';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  Image? _selectedImage;
  final textRecognizer = TextRecognizer();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

 

  Future<void> _pickImageFromGallery() async {
    final navigator = Navigator.of(context);
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = Image.file(File(image.path));
      });
      final file = File(image.path);
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);
      await navigator.push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              TextScanner(text: recognizedText.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue sur la page d'accueil"),
          /* if (_selectedImage != null) */
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            child: const Text("Selectionner une image"),
          ),
        ],
      ),
    );
  }
}
