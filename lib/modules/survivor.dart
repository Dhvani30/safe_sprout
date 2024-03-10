import 'package:flutter/material.dart';

class SurvivorStory extends StatelessWidget {
  const SurvivorStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survivor Story'),
      ),
      body: Center(
        child: Text(
          'Survivor Story',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
