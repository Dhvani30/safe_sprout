import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/utils/quotes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomAppBar extends StatelessWidget {
  // const CustomAppBar({super.key});
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({super.key, this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Text(
        sweetSayings[quoteIndex!],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
