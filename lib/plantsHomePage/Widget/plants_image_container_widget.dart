import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsDetailPage/Page/plants_detail_page.dart';

class PlantsImageContainerWidget extends StatelessWidget {
  const PlantsImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifierX,
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 280, // Buraya istediğiniz sınırlayıcı yüksekliği verin
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: getdataList.length,
                itemBuilder: (context, index) {
                  return plantsImageContainer(index, context);
                },
              ),
            ),
          );
        });
  }

  Widget plantsImageContainer(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10),
      child: InkWell(
        onTap: () {
          selectedPlantsIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlantsDetailPage(),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Container(
            width: 200,
            height: 280,
            decoration: const BoxDecoration(
              color: Color(0xffBFEDBE),
            ),
            child: CachedNetworkImage(
              imageUrl: getdataList[index]["ImageUrl"],
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child:
                    CircularProgressIndicator(), // Show a loading indicator while the image is being fetched.
              ),
              errorWidget: (context, url, error) => const Icon(Icons
                  .error), // Show an error icon if the image fails to load.
            ),
          ),
        ),
      ),
    );
  }
}
