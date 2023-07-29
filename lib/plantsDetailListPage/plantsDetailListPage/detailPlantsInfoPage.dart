import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsDetailListPage/Widget/detail_topbar_widget.dart';

class DetailPlantsInfoPage extends StatefulWidget {
  const DetailPlantsInfoPage({super.key});

  @override
  State<DetailPlantsInfoPage> createState() => _DetailPlantsInfoPageState();
}

class _DetailPlantsInfoPageState extends State<DetailPlantsInfoPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xff9CD9A1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailTopBarWidget(
                  topBarTitle: getdataList[detailsIndex]["PlantSpecies"]),
              detailsContainerWidget(context, "Plant Species :",
                  getdataList[detailsIndex]["PlantSpecies"]),
              detailsContainerWidget(context, "Plant Size :",
                  getdataList[detailsIndex]["PlantSize"]),
              detailsContainerWidget(context, "Water Period :",
                  getdataList[detailsIndex]["WaterPeriot"].toString()),
              detailsImageContainerWidget(),
            ],
          ),
        ),
      ),
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
          imageUrl: getdataList[detailsIndex]["ImageUrl"],
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
