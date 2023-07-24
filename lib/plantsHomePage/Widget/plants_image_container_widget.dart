import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsDetailPage/Page/plants_detail_page.dart';

class PlantsImageContainerWidget extends StatelessWidget {
  const PlantsImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => PlantsDetailPage(),
              ));
        },
        child: Container(
          width: 200,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xffBFEDBE),
            image: DecorationImage(
                image: NetworkImage(getdataList[index]["İmageUrl"]),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
