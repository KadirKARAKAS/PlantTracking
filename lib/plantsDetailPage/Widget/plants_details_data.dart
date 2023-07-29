import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class PlansDetailsData extends StatelessWidget {
  const PlansDetailsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        detailsContainerWidget(context, "Plant Species :",
            getdataList[selectedPlantsIndex]["PlantSpecies"]),
        detailsContainerWidget(context, "Plant Size :",
            getdataList[selectedPlantsIndex]["PlantSize"]),
        detailsContainerWidget(context, "Water Period :",
            getdataList[selectedPlantsIndex]["WaterPeriot"].toString()),
        detailsImageContainerWidget(),
      ],
    );
  }

  Widget detailsContainerWidget(
      BuildContext context, String detailText, String plansDataText) {
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
              child: Row(
                children: [
                  Text(
                    detailText,
                    style: const TextStyle(
                        color: Color(0xff9A9A9A),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      plansDataText,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget detailsImageContainerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: CachedNetworkImage(
          imageUrl: getdataList[selectedPlantsIndex]["ImageUrl"],
          width: 250,
          height: 350,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.photo,
            size: 50,
          ),
        ),
      ),
    );
  }
}
