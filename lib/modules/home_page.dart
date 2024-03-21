import 'package:dice_app/modules/Contacts/add_contacts.dart';
import 'package:dice_app/modules/Emergencies/Emergency.dart';
import 'package:dice_app/modules/Emagazine/e_magazine.dart';
import 'package:dice_app/modules/FriendLocator.dart';
import 'package:dice_app/modules/SOS/bg_sms.dart';
import 'package:dice_app/modules/SOS/sos.dart';
import 'package:dice_app/modules/SurvivorStories/survivor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safe Sprout"),
        // backgroundColor: const Color.fromARGB(255, 157, 129, 137),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromARGB(25, 51, 51, 51),
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    SmsService.sendSmsWithLocation('9869614268');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SmsSenderPage()),
                    // );
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/news.png",
                  height: 36,
                ),
                const Text("EMagazine"),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/call.png",
                  height: 36,
                ),
                const Text("Contacts"),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/location.png",
                  height: 36,
                ),
                const Text("Friend \n Locator"),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/stories.png",
                  height: 36,
                ),
                const Text("Survivor \n Stories"),
              ],
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          HapticFeedback.mediumImpact();
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EMagazine()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContacts()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendLocator()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SurvivorStory()),
              );
              break;
          }
        },
      ),
    );
  }
}
