import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/components/custom_container.dart';
import 'package:grocery_app_ui/screens/login_screen/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 270),
              child: Image.asset('lib/assets/images/top_right_leaf.png'),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Image.asset(
                'lib/assets/images/logo.png',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                '     Get your groceries delivered to your home',
                style: GoogleFonts.dmSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                '  The best delivery app in town for delivering your daily fresh groceries',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(30),
              color: Colors.green.shade700,
              height: 50,
              child: Text(
                'Shop Now',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              width: 165,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 337),
              child: Image.asset('lib/assets/images/center_right_leaf.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Image.asset('lib/assets/images/bottom_left_leaf.png'),
            ),
            Image.asset(
              'lib/assets/images/healthy_food_background.png',
              scale: 1.4,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
