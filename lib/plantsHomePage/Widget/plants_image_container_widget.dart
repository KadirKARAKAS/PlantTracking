import 'package:flutter/material.dart';

class PlantsImageContainerWidget extends StatelessWidget {
  const PlantsImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            plantsImageContainer(),
            plantsImageContainer(),
            plantsImageContainer(),
            plantsImageContainer(),
            plantsImageContainer(),
          ],
        ));
  }

  Widget plantsImageContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10),
      child: Container(
        width: 200,
        height: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: Colors.red),
      ),
    );
  }
}
