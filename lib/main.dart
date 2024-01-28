import 'package:flutter/material.dart';
import 'package:basic_currency_converter_app/pages/currency_converter_materal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeMateralPageStateFul(),
    );
  }
}