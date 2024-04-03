import 'package:flutter/material.dart';
import 'package:dice_app/utils/quotes.dart';
import 'package:dice_app/modules/Custom/safewebview.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CustomCarouel extends StatelessWidget {
  const CustomCarouel({Key? key}) : super(key: key);

  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 160,
      width: screenWidth, // Adjust the height of the card
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: List.generate(
          imageSliders.length,
          (index) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                if (index == 0) {
                  navigateToRoute(
                    context,
                    SafeWebView(
                      url: "https://amritmahotsav.nic.in/blogdetail.htm?75",
                    ),
                  );
                } else if (index == 1) {
                  navigateToRoute(
                    context,
                    SafeWebView(
                      url:
                          "https://plan-international.org/ending-violence/16-ways-end-violence-girls",
                    ),
                  );
                } else if (index == 2) {
                  navigateToRoute(
                    context,
                    SafeWebView(
                      url:
                          "https://www.healthline.com/health/womens-health/self-defense-tips-escape",
                    ),
                  );
                } else {
                  navigateToRoute(
                    context,
                    SafeWebView(
                      url:
                          "https://www.healthline.com/health/womens-health/self-defense-tips-escape",
                    ),
                  );
                }
              },
              child: Container(
                // height: 90,
                // height: MediaQuery.of(context).size.width * 0.68,
                // width: MediaQuery.of(context).size.width *
                // 0.68, // Adjust the width of the card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageSliders[index],
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        articleTitle[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
