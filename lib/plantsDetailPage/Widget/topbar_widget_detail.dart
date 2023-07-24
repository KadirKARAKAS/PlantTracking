import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsHomePage/Page/plants_home_page.dart';

class TopBarDetailWidget extends StatelessWidget {
  const TopBarDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: 80,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 30),
        child: Center(
          child: Text(
            getdataList[selectedPlantsIndex]["PlantSpecies"],
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlantsHomePage(),
                      ));
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 32,
                )),
          )),
    ]);
  }
}
