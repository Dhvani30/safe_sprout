import 'package:dice_app/modules/Emergencies/AmbulanceEmergency.dart';
import 'package:dice_app/modules/Emergencies/PoliceEmergency.dart';
import 'package:dice_app/modules/Emergencies/FirebrigadeEmergency.dart';
import 'package:dice_app/modules/Emergencies/GeneralEmergency.dart';
import 'package:dice_app/modules/Emergencies/WomenEmergency.dart';
import 'package:flutter/material.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          WomenEmergency(),
          PoliceEmergency(),
          AmbulanceEmergency(),
          FirebrigadeEmergency(),
          GeneralEmergency(),
        ],
      ),
    );
  }
}
