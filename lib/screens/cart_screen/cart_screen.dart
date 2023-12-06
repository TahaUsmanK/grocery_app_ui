import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index]['imagePath'] ?? '',
                              height: 36,
                            ),
                            title: Text(
                              value.cartItems[index]['name'] ?? '',
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  '\$${value.cartItems[index]['price'] ?? "0.00"}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 8),
                                _buildQuantityControl(context, index),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQuantityControl(BuildContext context, int index) {
    final cartModel = Provider.of<CartModel>(context, listen: false);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            cartModel.decrementQuantity(index);
          },
        ),
        Text(
          '${cartModel.cartItems[index]['quantity']}',
          style: const TextStyle(fontSize: 12),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            cartModel.incrementQuantity(index);
          },
        ),
      ],
    );
  }
}
