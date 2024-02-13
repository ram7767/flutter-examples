import 'package:basic_e_commerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 30,
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Product',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                "Are sure you want to delete product?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .deleteProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              title: Text(
                cartItem['title'] as String,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text("${cartItem['sizes']}"),
            );
          }),
    );
  }
}
