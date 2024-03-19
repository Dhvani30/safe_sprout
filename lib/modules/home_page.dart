import 'package:dice_app/modules/Contacts/add_contacts.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/modules/Emergencies/Emergency.dart';
import 'package:dice_app/modules/Emagazine/e_magazine.dart';
import 'package:dice_app/modules/FriendLocator.dart';
import 'package:dice_app/modules/survivor.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safe Sprout"),
        backgroundColor: const Color.fromARGB(255, 248, 245, 252),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 248, 245, 252),
          padding: const EdgeInsets.only(left: 5.0),
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
              const Row(
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
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: [
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
                    SizedBox(height: 10),
                    Emergency(),
                  ],
                ),
              ),
              const SizedBox(height: 110),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    // Add your logic for SOS button
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.black),
                    backgroundColor: const Color.fromARGB(255, 143, 29, 29),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 100),
                  ),
                  child: const Text(
                    'SOS',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EMagazine(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 110),
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
                          HapticFeedback.mediumImpact();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddContacts(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 110),
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
                            const SizedBox(height: 15),
                            const Text("Contacts"),
                            // const SizedBox(height: 80),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FriendLocator(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 110),
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
                            // const SizedBox(height: 15),
                            const Text("Friend \nLocator"),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SurvivorStory(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 110),
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
                            // const SizedBox(height: 15),
                            const Text("Survivor \n Stories"),
                            // const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
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
