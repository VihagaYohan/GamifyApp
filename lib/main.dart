import 'package:flutter/material.dart';

import './pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamify App',
     /*  theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light
      ), */
      theme: ThemeData(
        useMaterial3: true, 

        // define the default brightness and colors
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple,
        brightness: Brightness.dark)
      ),
      home: HomePage(),
    );
  }
}
