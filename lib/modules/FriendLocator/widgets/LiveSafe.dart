import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong! Call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLocationCard(
              context,
              onTap: () {
                openMap('police station near me');
              },
              icon: 'assets/images/policeloc.jpg',
              label: '  Police Station  ',
            ),
            const SizedBox(height: 20), // Add vertical space between cards
            _buildLocationCard(
              context,
              onTap: () {
                openMap('hospital near me');
              },
              icon: 'assets/images/hospitalloc.jpg',
              label: '  Hospital  ',
            ),
            const SizedBox(height: 20), // Add vertical space between cards
            _buildLocationCard(
              context,
              onTap: () {
                openMap('pharmacy near me');
              },
              icon: 'assets/images/mediloc.jpg',
              label: '  Pharmacy  ',
            ),
            const SizedBox(height: 20), // Add vertical space between cards
            _buildLocationCard(
              context,
              onTap: () {
                openMap('bus station near me');
              },
              icon: 'assets/images/busloc.jpg',
              label: '  Bus Station  ',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(
    BuildContext context, {
    required VoidCallback onTap,
    required String icon,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 150, // Set a finite height for the card
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 202, 232),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     bottomLeft: Radius.circular(20),
                      //   ),
                      // ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8), // Adjust padding here
                      // color: Colors.blue,
                      child: Center(
                        child: Card(
                          elevation: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              label,
                              selectionColor:
                                  const Color.fromARGB(255, 215, 202, 232),
                              style: const TextStyle(
                                fontSize: 20, // Increase font size if needed
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  icon,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
