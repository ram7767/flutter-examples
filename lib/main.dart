import 'package:basic_e_commerce_app/screen/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "shopping",
      debugShowCheckedModeBanner: false,
      home: const HomePageScreen(),
      theme: ThemeData(
        fontFamily: 'Lato',
        inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Color.fromARGB(119, 119, 119, 1),
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 76, 207, 244)),
        primaryColor: Color.fromARGB(255, 35, 171, 208),
      ),
    );
  }
}
