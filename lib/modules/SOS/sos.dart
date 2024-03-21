import 'package:dice_app/modules/FriendLocator/widgets/LiveSafe.dart';
import 'package:dice_app/modules/SOS/bg_sms.dart';
import 'package:flutter/material.dart';

class sos extends StatelessWidget {
  const sos({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore LiveSafe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: LiveSafe(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle SOS button tap by sending the SMS with current location
                  SmsService.sendSmsWithLocation('9869614268');
                },
                child: Text('SOS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
