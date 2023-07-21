import 'package:flutter/material.dart';

class PlantImageContainerWidget extends StatelessWidget {
  const PlantImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.89,
      height: size.height / 2.89,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0xffBFEDBE)),
    );
  }
}
