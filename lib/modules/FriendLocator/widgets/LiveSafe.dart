import 'package:dice_app/modules/FriendLocator/live_safe/BusStationCard.dart';
import 'package:dice_app/modules/FriendLocator/live_safe/PoliceStationCard.dart';
import 'package:dice_app/modules/FriendLocator/live_safe/HospitalCard.dart';
import 'package:dice_app/modules/FriendLocator/live_safe/Pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);
  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/police+stations+near+me/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          PoliceStationCard(onMapFunction: openMap),
          HospitalCard(onMapFunction: openMap),
          PharmacyCard(onMapFunction: openMap),
          BusStationCard(onMapFunction: openMap),
        ],
      ),
    );
  }
}
