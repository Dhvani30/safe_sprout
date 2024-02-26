import 'package:flutter/material.dart';

class SurvivorStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survivor Stories'),
      ),
      body: Center(
        child: Text(
          'This is the Survivor Stories page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
