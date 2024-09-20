import 'package:dice_app/modules/FriendLocator/widgets/LiveSafe.dart';
import 'package:flutter/material.dart';

class FriendLocator extends StatelessWidget {
  const FriendLocator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FriendLocator'),
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Explore LiveSafe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LiveSafe(),
          ],
        ));
  }
}
