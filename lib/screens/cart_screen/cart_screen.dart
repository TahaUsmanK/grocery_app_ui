import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/components/custom_container.dart';
import 'package:grocery_app_ui/models/cart_model.dart';
import 'package:grocery_app_ui/screens/home_screen/home_screen.dart';
import 'package:grocery_app_ui/screens/track_order_screen/track_order_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
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
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Cart ',
                              style: GoogleFonts.dmSans(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset('lib/assets/images/basket.png'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade500,
                                width: 0.3,
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index]['imagePath'] ?? '',
                              height: 42,
                            ),
                            title: Text(
                              value.cartItems[index]['name'] ?? '',
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  '1kg, \$${value.cartItems[index]['price'] ?? "0.00"}',
                                  style: GoogleFonts.dmSans(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.green,
                                  iconSize: 38,
                                  onPressed: () {
                                    value.decrementQuantity(index);
                                  },
                                ),
                                Text(
                                  value.cartItems[index]['quantity'] ?? '0',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  color: Colors.green,
                                  iconSize: 38,
                                  onPressed: () {
                                    value.incrementQuantity(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 29),
                child: Center(
                  child: CustomContainer(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                    height: 53,
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    width: double.infinity,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackOrderScreen()));
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
