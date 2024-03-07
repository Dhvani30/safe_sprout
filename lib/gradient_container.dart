import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/login_page.dart'; // Import LoginPage
import 'modules/register.dart'; // Import RegisterPage

const startAlign = Alignment.topCenter;
const endAlign = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {Key? key})
      : super(key: key);

  final Color color1;
  final Color color2;

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
            const SizedBox(height: 100),
            Text(
              'SafeSprout',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  fontSize: 48,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text('LOGIN'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text('REGISTER'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
