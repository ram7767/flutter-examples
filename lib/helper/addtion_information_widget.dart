import 'package:flutter/material.dart';

// AddtionInformationWidget
class AddtionInformationWidget extends StatelessWidget {
  const AddtionInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.water_drop_sharp,
          size: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "weather",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "16",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
