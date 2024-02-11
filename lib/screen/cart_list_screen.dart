import 'package:basic_e_commerce_app/helper/global_varaibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => 'hi',
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final cartItem = products[index];
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
                subtitle: Text("${cartItem['prices']}"),
              );
            }),
      ),
    );
  }
}
