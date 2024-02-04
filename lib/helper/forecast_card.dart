import 'package:flutter/material.dart';
import 'dart:ui';

// ForecastCard
class ForecastCard extends StatelessWidget {
  final IconData icon;
  final String weather;
  final String degree;
  const ForecastCard(
      {super.key,
      required this.icon,
      required this.weather,
      required this.degree});

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "$degree K",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  icon,
                  size: 40,
                ),
                Text(
                  weather,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
