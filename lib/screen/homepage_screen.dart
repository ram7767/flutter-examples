import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<String> filter = const ['ALL', 'Bata', 'WoodLand', 'PUMA'];
  late String seletedFilter;

  @override
  Widget build(BuildContext context) {
    seletedFilter = filter[0];
    return Scaffold(
        body: Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Shoe\ncollection',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
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
            )),
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              itemCount: filter.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = filter[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      seletedFilter = item;
                    },
                    child: Chip(
                      label: Text(
                        item,
                        style: TextStyle(
                            color: seletedFilter == item
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Color.fromARGB(255, 160, 99, 188)),
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
              }),
        )
      ],
    ));
  }
}
