import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class TaskDetailPageWidget extends StatelessWidget {
  const TaskDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: valueNotifierX,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: getdataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: size.height / 1.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24,
                    ),
                    child: Column(
                      children: [
                        Text(
                          getdataList[index]["PlantSpecies"],
                          style: const TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        addWaterContainerWidget(index, context),
                        addSunContainerWidegt(index, context),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: size.width,
                              height: size.height / 3,
                              child: CachedNetworkImage(
                                imageUrl: getdataList[index]["ImageUrl"],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget addWaterContainerWidget(int index, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
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
                    // ignore: prefer_interpolation_to_compose_strings
                    "Don't forget to water the " +
                        getdataList[index]["PlantSpecies"] +
                        ".",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
    );
  }

  Widget addSunContainerWidegt(int index, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
                    // ignore: prefer_interpolation_to_compose_strings
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
    );
  }

  // Widget notificationContainerWithImage(int index, BuildContext context) {
  //   return

  //       Column(
  //         children: [
  //           addWaterContainerWidget(index, context),
  //           addSunContainerWidegt(index, context),
  //         ],
  //       ),

  // }
}
