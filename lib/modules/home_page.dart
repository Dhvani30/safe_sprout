import 'package:dice_app/database_helper.dart';
import 'package:dice_app/modules/Contacts/add_contacts.dart';
import 'package:dice_app/modules/Contacts/model/contactsm.dart';
import 'package:dice_app/modules/Emergencies/Emergency.dart';
import 'package:dice_app/modules/Emagazine/e_magazine.dart';
import 'package:dice_app/modules/FriendLocator.dart';
import 'package:dice_app/modules/SOS/bg_sms.dart';
// import 'package:dice_app/modules/SOS/sms_service.dart'; // Import the SmsService class
import 'package:dice_app/modules/SurvivorStories/survivor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

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
                  onPressed: () async {
                    HapticFeedback.mediumImpact();
                    List<TContact> contactList =
                        await DatabaseHelper().getContactList();
                    print(contactList.length);
                    if (contactList.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Emergency contact list is empty");
                    } else {
                      try {
                        // Check if location service is enabled
                        if (!await Geolocator.isLocationServiceEnabled()) {
                          throw 'Location service disabled';
                        }

                        // Request location permission
                        LocationPermission permission =
                            await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied ||
                            permission == LocationPermission.deniedForever) {
                          permission = await Geolocator.requestPermission();
                          if (permission == LocationPermission.denied ||
                              permission == LocationPermission.deniedForever) {
                            throw 'Location permission denied';
                          }
                        }

                        // Get current location
                        Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high,
                        );

                        double latitude = position.latitude;
                        double longitude = position.longitude;

                        // Construct Google Maps link
                        String googleMapsLink =
                            'https://www.google.com/maps?q=$latitude,$longitude';

                        // Construct SMS message with location
                        String messageBody =
                            'Need help! Please track me here: $googleMapsLink';

                        // Send SMS to each contact
                        for (TContact contact in contactList) {
                          String phoneNumber = contact.number;
                          await SmsService.sendSmsWithLocation(
                            phoneNumber,
                            messageBody,
                          );
                          print("SMS sent successfully to $phoneNumber");
                        }
                      } catch (error) {
                        print("Error sending SOS: $error");
                        Fluttertoast.showToast(
                          msg: "Failed to send SOS message: $error",
                        );
                      }
                    }
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
