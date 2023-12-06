import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/screens/home_screen/home_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 470),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Column(
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
            ],
          ),
          Positioned(
            top: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12),
                Text(
                  'Arabic Ginger',
                  style: GoogleFonts.dmSans(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 66),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade200,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '4',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            left: 14,
            child: Text(
              '1kg,4\$',
              style: GoogleFonts.dmSans(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red),
            ),
          ),
          Positioned(
            top: 490,
            left: 24,
            right: 36,
            child: Text(
              'Ginger is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
