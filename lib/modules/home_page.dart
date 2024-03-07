import 'package:dice_app/modules/Emergencies/Emergency.dart';
import 'package:dice_app/modules/Emagazine/e_magazine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dice_app/modules/survivor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back!',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 248, 245, 252), // Set black background color
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Connected Accounts',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SingleChildScrollView(
                  // Wrap with SingleChildScrollView
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(''),
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(''),
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(''),
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(''),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Text(
                        "Emergency",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Emergency(),
                    ],
                  )),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your logic for SOS button
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.black),
                      backgroundColor: const Color.fromARGB(255, 143, 29, 29),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 100),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 2, color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    child: const Text(
                      'SOS',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EMagazine()),
                          );
                          // Add your logic for e-Magazine button
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 119, 55, 95),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 213, 213, 213),
                                width: 2,
                              ),
                            ),
                            minimumSize: const Size(2500.0, 0)),
                        child: Text(
                          'E-Magazine',
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add your logic for Friend Locator button
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 119, 55, 95),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 213, 213, 213),
                                width: 2,
                              ),
                            ),
                            minimumSize: const Size(2500.0, 0)),
                        child: Text(
                          'Friend Locator',
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SurvivorStory()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 119, 55, 95),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 213, 213, 213),
                                width: 2,
                              ),
                            ),
                            minimumSize: const Size(2500.0, 0)),
                        child: Text(
                          'Survivor Stories',
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
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
      ),
    );
  }
}
