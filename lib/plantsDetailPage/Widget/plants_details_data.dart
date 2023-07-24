import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class PlansDetailsData extends StatelessWidget {
  const PlansDetailsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        detailsContainerWidget(
            context, getdataList[selectedPlantsIndex]["PlantSpecies"]),
        detailsContainerWidget(
            context, getdataList[selectedPlantsIndex]["PlantSize"]),
        detailsContainerWidget(context,
            getdataList[selectedPlantsIndex]["WaterPeriot"].toString()),
        detailsImageContainerWidget(),
      ],
    );
  }

  Widget detailsContainerWidget(BuildContext context, String detailText) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
            color: const Color(0xffDEFFDD),
            borderRadius: BorderRadius.circular(11)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detailText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }

  Widget detailsImageContainerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: 250,
        height: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    NetworkImage(getdataList[selectedPlantsIndex]["İmageUrl"]),
                fit: BoxFit.cover)),
      ),
    );
  }
}
