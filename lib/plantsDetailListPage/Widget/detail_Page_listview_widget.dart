import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsDetailListPage/plantsDetailListPage/detailPlantsInfoPage.dart';

class DetailPageListviewWidget extends StatelessWidget {
  const DetailPageListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getdataList.length,
      itemBuilder: (context, index) {
        return listviewContainer(index, context);
      },
    );
  }

  Widget listviewContainer(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: InkWell(
        onTap: () {
          detailsIndex = index;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPlantsInfoPage(),
              ));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xffBFEDBE),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        blurStyle: BlurStyle.normal),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: getdataList[index]["ImageUrl"],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color(0xffDEFFDD),
                    borderRadius: BorderRadius.circular(9)),
                child: Center(
                  child: Text(
                    getdataList[index]["PlantSpecies"],
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 1,
                              color: Colors.black12,
                              offset: Offset(-2, 3))
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
