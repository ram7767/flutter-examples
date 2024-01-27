import 'package:flutter/material.dart';

class HomeMateralPage extends StatelessWidget {
  const HomeMateralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 225, 212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("hi",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 153, 233),
                ),
                decoration: InputDecoration(
                 hintText: "Enter amount in USD",
                 filled: true,
                 fillColor: Color.fromARGB(255, 251, 251, 251),
                 hintStyle: TextStyle(
                  color: Color.fromARGB(179, 64, 63, 63),
                 ),
                 prefixIcon: Icon(Icons.monetization_on),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 251, 251, 251),
                    width: 0,
                  ),
                 ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 251, 251, 251),
                    width: 0,
                  ),
                ),
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
        ],
      ),
      ),
    );
  }  
}