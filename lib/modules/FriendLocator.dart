import 'package:flutter/material.dart';

class FriendLocator extends StatelessWidget {
  const FriendLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendLocator'),
      ),
      body: Center(
        child: Text(
          'FriendLocator',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
