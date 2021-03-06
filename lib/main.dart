import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamify App',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}

