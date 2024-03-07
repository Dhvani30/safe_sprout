import 'package:flutter/material.dart';

class PoliceEmergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 224, 226, 246),
                      Color.fromARGB(255, 233, 212, 232),
                      Color.fromARGB(255, 250, 187, 208),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: Image.asset(
                          'assets/images/alert.png',
                          // Ensure image path is correct
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Active Emergency",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.visible,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          Text(
                            "Call 112 Emergencies",
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.visible,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
