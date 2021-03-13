import 'package:flutter/material.dart';
import 'package:ui/Landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/landing.jpg"), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore Nature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
    );
  }
}
