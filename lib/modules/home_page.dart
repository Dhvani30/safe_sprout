import 'package:contacts_service/contacts_service.dart';
// import 'package:dice_app/modules/Contacts.dart';
import 'package:dice_app/modules/Emergencies/Emergency.dart';
import 'package:dice_app/modules/Emagazine/e_magazine.dart';
import 'package:dice_app/modules/FriendLocator.dart';
import 'package:dice_app/modules/contacts/contacts_features.dart';
import 'package:dice_app/modules/survivor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Safe Sprout',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 248, 245, 252),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 248, 245, 252),
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connected Accounts',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(''),
                  ),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(''),
                  ),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(''),
                  ),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(''),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Emergency",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Emergency(),
                  ],
                ),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EMagazine(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Image.asset(
                                "assets/images/news.png",
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("EMagazine"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FriendLocator(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Image.asset(
                                "assets/images/location.png",
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Friend Locator"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurvivorStory(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Image.asset(
                                "assets/images/stories.png",
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Survivor Stories"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactsFeature(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Image.asset(
                                "assets/images/call.png",
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Contacts"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
