import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class PlantWaterContainerWidget extends StatelessWidget {
  const PlantWaterContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        waterContainer(size / 1.3, "Once Daily", () {
          selectionWaterContainer = 0;
        }),
        const SizedBox(width: 5),
        waterContainer(size / 1.3, "Twice Daily", () {
          selectionWaterContainer = 1;
        }),
        const SizedBox(width: 5),
        waterContainer(size, "Once or Twice a Week", () {
          selectionWaterContainer = 2;
        })
      ],
    );
  }

  Widget waterContainer(Size size, String containerText, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 3,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xffBFEDBE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            containerText,
            style: TextStyle(color: Color(0xff747474)),
          ),
        ),
      ),
    );
  }
}
