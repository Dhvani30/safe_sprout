import 'package:flutter/material.dart';
import 'package:dice_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home:
          //  EMagazine() //adding default page as emagazine for testing purpose
          Scaffold(
        backgroundColor: Color.fromARGB(255, 121, 80, 185),
        body: GradientContainer(
          Color.fromARGB(255, 201, 178, 239),
          // Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 212, 214, 249),
          Color.fromARGB(255, 233, 212, 232),
          // Color.fromARGB(255, 250, 187, 208),
        ),
      ),
    ),
  ); //runApp
}
