import 'package:flutter/material.dart';
import 'dart:ui';

// ForecastCard
class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.elliptical(15, 15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "300`F",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.cloud,
                  size: 40,
                ),
                Text(
                  "Rain",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
