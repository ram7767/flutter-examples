import 'package:basic_e_commerce_app/provider/cart_provider.dart';
import 'package:basic_e_commerce_app/screen/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        title: "shopping",
        debugShowCheckedModeBanner: false,
        home: const HomePageScreen(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          fontFamily: 'Lato',
          inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Color.fromARGB(228, 102, 189, 220),
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 82, 172, 197),
            primary: const Color.fromARGB(255, 143, 215, 236),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
