import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_ui/screens/home_screen/home_screen.dart';
import 'package:grocery_app_ui/screens/intro_screen/intro_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:grocery_app_ui/components/numpad.dart';
import 'package:grocery_app_ui/components/custom_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phonenumberController = TextEditingController();
  FocusNode _phonenumberFocus = FocusNode();
  bool isNumpadVisible = false;

  void onTextFieldFocused() {
    setState(() {
      isNumpadVisible = true;
    });
  }

  void onTextFieldUnfocused() {
    setState(() {
      isNumpadVisible = false;
    });
  }

  void onNumpadButtonPressed(String value) {
    _phonenumberController.text += value;
  }

  void onBackspacePressed() {
    if (_phonenumberController.text.isNotEmpty) {
      _phonenumberController.text = _phonenumberController.text
          .substring(0, _phonenumberController.text.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        onTextFieldUnfocused();
      },
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IntroScreen(),
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
                    SizedBox(height: 25),
                    Center(
                      child: CircleAvatar(
                        radius: 46,
                        child: Image.asset('lib/assets/images/logo.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Center(
                        child: Text(
                          'Enter your mobile Number',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Center(
                        child: Text(
                          'We will send you a verification code',
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          onTextFieldFocused();
                        },
                        child: IgnorePointer(
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {},
                            onInputValidated: (bool value) {},
                            inputDecoration: InputDecoration(
                              hintText: '(000) 000-00-00',
                              hintStyle: GoogleFonts.dmSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            autoFocus: false,
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DROPDOWN,
                              trailingSpace: false,
                              showFlags: false,
                            ),
                            ignoreBlank: false,
                            initialValue: PhoneNumber(isoCode: 'US'),
                            textFieldController: _phonenumberController,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: CustomContainer(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green.shade600,
                        height: 55,
                        child: Center(
                          child: Text(
                            'Continue',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        width: double.infinity,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'By clicking on “Continue” you are agreeing ',
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
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 14,
                        bottom: 16,
                        right: 14,
                      ),
                      child: Expanded(
                        child: CustomContainer(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200,
                          height: 280,
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
          ),
        ),
      ),
    );
  }
}
