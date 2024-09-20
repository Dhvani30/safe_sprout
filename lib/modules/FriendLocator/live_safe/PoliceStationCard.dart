import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function? onMapFunction;
  const PoliceStationCard({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onMapFunction!('police station near me');
          },
          child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset('assets/images/policeloc.jpg'),
                ),
              )),
        ),
        const Text('Police Stations'),
      ],
    );
  }
}
