import 'package:flutter/material.dart';
import 'package:dice_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 121, 80, 185),
        body: GradientContainer(Color.fromARGB(255, 121, 80, 185),
            Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
  ); //runApp
}
