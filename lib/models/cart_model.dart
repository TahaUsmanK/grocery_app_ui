import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, String>> shopItems = [
    {
      'name': 'Arabic Ginger',
      'price': '4',
      'imagePath': 'lib/assets/images/arabic_ginger.png',
    },
    {
      'name': 'Bell Pepper Red',
      'price': '6',
      'imagePath': 'lib/assets/images/red_bell_pepper.png',
    },
    {
      'name': 'Fresh Broccoli',
      'price': '2',
      'imagePath': 'lib/assets/images/fresh_broccoli.png',
    },
    {
      'name': 'Fresh Lettuce',
      'price': '2',
      'imagePath': 'lib/assets/images/fresh_lettuce.png',
    },
    {
      'name': 'Organic Carrots',
      'price': '4',
      'imagePath': 'lib/assets/images/organic_carrots.png',
    },
    {
      'name': 'Butternut Squash',
      'price': '8',
      'imagePath': 'lib/assets/images/butternut_squash.png',
    },
    {
      'name': 'Lamb Meat',
      'price': '45',
      'imagePath': 'lib/assets/images/lamb_meat.png',
    },
  ];

  List<Map<String, String>> cartItems = [];

  List<Map<String, String>> get getCartItems => cartItems;
  List<Map<String, String>> get getShopItems => shopItems;

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i]['price'] ?? '0');
    }
    return totalPrice.toStringAsFixed(2);
  }

  void addItemToCart(int index) {
    final Map<String, String> newItem =
        Map<String, String>.from(shopItems[index]);
    newItem['quantity'] = '1';
    cartItems.add(newItem);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    int currentQuantity = int.parse(cartItems[index]['quantity'] ?? '0');
    cartItems[index]['quantity'] = (currentQuantity + 1).toString();
    notifyListeners();
  }

  void decrementQuantity(int index) {
    int currentQuantity = int.parse(cartItems[index]['quantity'] ?? '0');
    if (currentQuantity > 1) {
      cartItems[index]['quantity'] = (currentQuantity - 1).toString();
      notifyListeners();
    }
  }
}
