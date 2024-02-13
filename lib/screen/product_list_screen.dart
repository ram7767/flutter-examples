import 'package:basic_e_commerce_app/helper/global_varaibles.dart';
import 'package:basic_e_commerce_app/helper/product_card.dart';
import 'package:basic_e_commerce_app/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filter = const ['ALL', 'Bata', 'WoodLand', 'PUMA'];
  late String seletedFilter;

  @override
  void initState() {
    super.initState();
    seletedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoe\ncollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(50)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(50)),
                      ),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filter.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = filter[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      seletedFilter = filter[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        item,
                        style: TextStyle(
                            color: seletedFilter == item
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : const Color.fromARGB(255, 160, 99, 188)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      backgroundColor: seletedFilter == item
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1028) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetailsScreen(product: product);
                            }));
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            cost: product['prices'] as double,
                            imageUrl: product['imageUrl'] as String,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetailsScreen(product: product);
                            }));
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            cost: product['prices'] as double,
                            imageUrl: product['imageUrl'] as String,
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
