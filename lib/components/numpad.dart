import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Numpad extends StatelessWidget {
  const Numpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double buttonHeight = screenHeight * 0.07;
    double fontSize = screenHeight * 0.02;

    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 1; i <= 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 1; j <= 3; j++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => ('${(i - 1) * 3 + j}'),
                      child: Container(
                        height: buttonHeight,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '${(i - 1) * 3 + j}',
                            style: GoogleFonts.dmSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(left: 144),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => ('0'),
                  child: Container(
                    height: buttonHeight,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '0',
                        style: GoogleFonts.dmSans(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: buttonHeight,
                    width: 94,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
