import 'package:basic_e_commerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['company'] as String),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 300,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(207, 200, 235, 0.782),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['prices']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedSize != 0) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct(
                          {
                            'id': widget.product['id'],
                            'title': widget.product['title'],
                            'prices': widget.product['prices'],
                            'sizes': selectedSize,
                            'imageUrl': widget.product['imageUrl'],
                            'company': widget.product['company'],
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Product added succuesfully")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please select a size")));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: Size(double.infinity, 50)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
