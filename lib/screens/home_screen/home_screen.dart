import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/components/custom_container.dart';
import 'package:grocery_app_ui/components/grocery_item_tile.dart';
import 'package:grocery_app_ui/models/cart_model.dart';
import 'package:grocery_app_ui/screens/cart_screen/cart_screen.dart';
import 'package:grocery_app_ui/screens/items_screen/items_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: '',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade300,
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.shopping_cart, color: Colors.white),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'lib/assets/images/profile_avatar.png'),
                          radius: 20,
                          backgroundColor: Colors.grey.shade300,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Amelia Barlow',
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomContainer(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      height: 50,
                      width: 125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Text(
                            'My Flat',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 10,
                  left: 10,
                ),
                child: CustomContainer(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 18,
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: Colors.green,
                      ),
                      Expanded(
                        child: Text(
                          'Search Category',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 10,
                  left: 10,
                ),
                child: Image.asset(
                  'lib/assets/images/offer.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories ',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('lib/assets/images/emoji1.png'),
                    SizedBox(width: 190),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See all',
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 10,
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Image.asset('lib/assets/images/apple.png'),
                      radius: 35,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemScreen()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        child: Image.asset('lib/assets/images/broccoli.png'),
                        radius: 35,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Image.asset('lib/assets/images/cheese.png'),
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Image.asset('lib/assets/images/meat.png'),
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Best Selling ',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('lib/assets/images/fire.png'),
                    SizedBox(width: 180),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See all',
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index]['name'] ?? '',
                        itemPrice: value.shopItems[index]['price'] ?? '',
                        imagePath: value.shopItems[index]['imagePath'] ?? '',
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
