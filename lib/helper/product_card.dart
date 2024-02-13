import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double cost;
  final String imageUrl;
  const ProductCard(
      {super.key,
      required this.title,
      required this.cost,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(228, 188, 244, 255),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '\$$cost',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 3,
          ),
          Center(
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
