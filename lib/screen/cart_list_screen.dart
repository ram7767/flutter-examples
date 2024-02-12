import 'package:basic_e_commerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
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
                  onPressed: () {},
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
