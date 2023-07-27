// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    return ValueListenableBuilder(
      valueListenable: valueNotifierX,
      builder: (context, value, child) {
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
                return Column(
                  children: [
                    addWaterContainerWidget(index),
                    addSunContainerWidegt(index),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget addWaterContainerWidget(int index) {
    Size size = MediaQuery.of(context).size;
    print(slidableBool);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
                slidableBool = !slidableBool;
                await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("My Plants")
                    .doc(getdataList[index]["docId"])
                    .update({"SlidableBool": slidableBool});

                slidableIconVale = !slidableContainerColorValue;
                slidableContainerColorValue = !slidableContainerColorValue;
                isTextUnderlined = !isTextUnderlined;

                setState(() {});
              },
              icon: getdataList[index]['SlidableBool']
                  ? Icons.assignment_turned_in_rounded
                  : Icons.assignment_turned_in_outlined,
              backgroundColor: getdataList[index]['SlidableBool']
                  ? Colors.green
                  : Colors.red,
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
                      "Don't forget to water the " +
                          getdataList[index]["PlantSpecies"] +
                          ".",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: isTextUnderlined
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
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

  Widget addSunContainerWidegt(int index) {
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
                      "Put the " +
                          getdataList[index]["PlantSpecies"] +
                          " in the sun.",
                      textAlign: TextAlign.start,
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
