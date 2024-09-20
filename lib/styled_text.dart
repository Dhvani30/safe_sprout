import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.comfortaa(
        // ignore: prefer_const_constructors
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 40,
        ),
      ),
    );
  }
}
