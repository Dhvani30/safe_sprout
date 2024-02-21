import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

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
          children: [
            const SizedBox(height: 300),
            Text(
              'SafeSprout',
              style: GoogleFonts.comfortaa(
                // Apply Google Fonts style
                textStyle: TextStyle(
                  fontSize: 48,
                  color: const Color.fromARGB(
                      255, 0, 0, 0), // Change text color if needed
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Login Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                          color: Colors.black, width: 2), // Black border
                    ),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Text color for LOG IN button
                      ),
                    ),
                  ),
                  child: const Text('LOG IN'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Register Page
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
                    primary: Color.fromARGB(255, 255, 255, 255),
                    textStyle: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Text color for REGISTER button
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: GoogleFonts.comfortaa(
                // Apply Google Fonts style
                textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Set width to fill the horizontal space
              child: ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(15),
                  primary: Colors.black, // Button color
                  textStyle: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 20,
                  ),
                ),
                child: Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // Wrap your content with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: GoogleFonts.comfortaa(
                  // Apply Google Fonts style
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'College Code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enrollment Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width:
                    double.infinity, // Set width to fill the horizontal space
                child: ElevatedButton(
                  onPressed: () {
                    // Add your registration logic here
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(15),
                    primary: Colors.black, // Button color
                    textStyle: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 20,
                    ),
                  ),
                  child: Text('REGISTER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
