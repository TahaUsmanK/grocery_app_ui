import 'package:flutter/material.dart';
import 'package:grocery_app_ui/components/grocery_item_tile.dart';
import 'package:grocery_app_ui/models/cart_model.dart';
import 'package:grocery_app_ui/screens/home_screen/home_screen.dart';
import 'package:grocery_app_ui/screens/item_details_screen/item_details_screen.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.grey.shade50,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 0.3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Vegetable',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 30),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Icon(
                                    Icons.search_outlined,
                                    size: 18,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.grey.shade50,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 0.3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        padding: const EdgeInsets.all(12),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemDetailsScreen(),
                                ),
                              );
                            },
                            child: GroceryItemTile(
                              itemName: value.shopItems[index]['name'] ?? '',
                              itemPrice: value.shopItems[index]['price'] ?? '',
                              imagePath:
                                  value.shopItems[index]['imagePath'] ?? '',
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(index),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
