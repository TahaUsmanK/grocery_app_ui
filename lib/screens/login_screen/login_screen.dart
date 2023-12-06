import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/components/custom_container.dart';
import 'package:grocery_app_ui/components/numpad.dart';
import 'package:grocery_app_ui/screens/home_screen/home_screen.dart';
import 'package:grocery_app_ui/screens/intro_screen/intro_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroScreen(),
                        ));
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 0.3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('lib/assets/images/logo.png'),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Enter your mobile',
                  style: GoogleFonts.dmSans(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      'number',
                      style: GoogleFonts.dmSans(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  'We will send you a verification code',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+44',
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' |',
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '(000) 000-00-00',
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Center(
                child: CustomContainer(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green.shade600,
                  height: 55,
                  child: Text(
                    'Continue',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  width: 340,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'By clicking on “Continue” you are agreeing',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'to our',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      ' terms of use',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              //numpad
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                    right: 16,
                  ),
                  child: CustomContainer(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200,
                    height: double.infinity,
                    child: Numpad(),
                    width: double.infinity,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
