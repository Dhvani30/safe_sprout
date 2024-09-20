import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/login_page.dart'; // Import LoginPage
import 'modules/register.dart'; // Import RegisterPage

const startAlign = Alignment.topCenter;
const endAlign = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.color3, {super.key});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlign,
          end: endAlign,
          colors: [color1, color2],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 200),
            const SizedBox(height: 50),
            Text(
              'SafeSprout',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    //   side: BorderSide(color: Colors.black, width: 2),
                    // ),
                    elevation: 3,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: const Text('LOGIN'),
                ),
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    //   side: BorderSide(color: Colors.black, width: 2),
                    // ),
                    elevation: 3,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: const Text('REGISTER'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
