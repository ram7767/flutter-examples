import 'package:flutter/material.dart';

// AddtionInformationWidget
class AddtionInformationWidget extends StatelessWidget {
  final IconData icon;
  final String weather;
  final String value;
  const AddtionInformationWidget(
      {super.key,
      required this.icon,
      required this.weather,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          weather,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
