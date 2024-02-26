import 'package:dice_app/e_magazine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dice_app/modules/survivor.dart';
import 'package:dice_app/e_magazine.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back!',
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color.fromARGB(255, 121, 80, 185), // Set black background color
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connected Accounts',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                        AssetImage('assets/images/user-profile.jpg'),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                        AssetImage('assets/images/user-profile.jpg'),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                        AssetImage('assets/images/user-profile.jpg'),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                        AssetImage('assets/images/user-profile.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic for SOS button
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.black),
                    backgroundColor: Color.fromARGB(255, 143, 29, 29),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 100),
                    shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  child: Text(
                    'SOS',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EMagazine()),
                        );
                        // Add your logic for e-Magazine button
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 119, 55, 95),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 213, 213, 213),
                              width: 2,
                            ),
                          ),
                          minimumSize: Size(2500.0, 0)),
                      child: Text(
                        'E-Magazine',
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add your logic for Friend Locator button
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 119, 55, 95),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Color.fromARGB(255, 213, 213, 213),
                              width: 2,
                            ),
                          ),
                          minimumSize: Size(2500.0, 0)),
                      child: Text(
                        'Friend Locator',
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SurvivorStory()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 119, 55, 95),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Color.fromARGB(255, 213, 213, 213),
                              width: 2,
                            ),
                          ),
                          minimumSize: Size(2500.0, 0)),
                      child: Text(
                        'Survivor Stories',
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
