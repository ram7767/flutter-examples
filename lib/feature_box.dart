import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_assist_app/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headingText;
  final String text;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.text,
      required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(left: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headingText,
                style: const TextStyle(
                  fontFamily: 'Cera-Pro',
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Cera-Pro',
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
