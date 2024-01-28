import 'package:flutter/material.dart';

class HomeMateralPageStateFul extends StatefulWidget {
  const HomeMateralPageStateFul({super.key});

  @override
  State<HomeMateralPageStateFul> createState() => _HomeMateralPageStateFul();
}

class _HomeMateralPageStateFul extends State<HomeMateralPageStateFul> {

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter",
        style: TextStyle(fontWeight: FontWeight.normal,fontSize: 45),),
        backgroundColor: const Color.fromARGB(255, 97, 237, 202),
      ),
      backgroundColor: const Color.fromARGB(255, 172, 225, 212),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Convert ${result.toStringAsFixed(3)}\$",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              ),
             TextField(
              controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 54, 153, 233),
                ),
                decoration: const InputDecoration(
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
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                 ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 251, 251, 251),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed:  () {
                result = double.parse(textEditingController.text) * 81;
                setState(() {});
                },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50),),
              ),
              child: const Text("Convert"),),
          ],
        ),
        ),
      ),
    );
  }
}