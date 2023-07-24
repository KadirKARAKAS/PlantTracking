// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plant_tracking/Utils/constant.dart';

class NotificationContainerWidget extends StatefulWidget {
  const NotificationContainerWidget({super.key});

  @override
  State<NotificationContainerWidget> createState() =>
      _NotificationContainerWidgetState();
}

class _NotificationContainerWidgetState
    extends State<NotificationContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Container(
        width: size.width,
        height: 300,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: getdataList.length,
          itemBuilder: (context, index) {
            waterPeriod = getdataList[index]["WaterPeriot"];

            return Column(
              children: [
                addWaterContainerWidget(index, waterPeriod),
                addSunContainerWidegt(index, waterPeriod),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget addWaterContainerWidget(int index, String waterPeriod) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              icon: Icons.delete,
              backgroundColor: const Color(0XffFF6961),
              borderRadius: BorderRadius.circular(9),
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: 67,
              decoration: BoxDecoration(
                color: const Color(0xffDEFFDD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Don't forget to water the " +
                          getdataList[index]["PlantSpecies"] +
                          ".",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 20,
              right: 15,
              width: 30,
              height: 30,
              child: Image(image: AssetImage("assets/dropwater.png")),
            ),
          ],
        ),
      ),
    );
  }

  Widget addSunContainerWidegt(int index, String waterPeriod) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            backgroundColor: const Color(0XffFF6961),
            borderRadius: BorderRadius.circular(9),
          )
        ]),
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: 67,
              decoration: BoxDecoration(
                color: const Color(0xffDEFFDD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Put the " +
                          getdataList[index]["PlantSpecies"] +
                          " in the sun.",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 20,
              right: 15,
              width: 30,
              height: 30,
              child: Image(image: AssetImage("assets/sun.png")),
            ),
          ],
        ),
      ),
    );
  }
}
  //   Widget  changeToSoilContainerWidget() {
  //   return Container();
  // }

