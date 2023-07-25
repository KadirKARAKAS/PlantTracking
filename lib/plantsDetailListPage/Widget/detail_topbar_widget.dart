import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsHomePage/Page/plants_home_page.dart';

class DetailTopBarWidget extends StatelessWidget {
  const DetailTopBarWidget({super.key, required this.topBarTitle});
  final String topBarTitle;
  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: 80,
      ),
      Padding(
        padding: EdgeInsets.only(top: 40, bottom: 30),
        child: Center(
          child: Text(
            topBarTitle,
            style:
                TextStyle(fontSize: 32, fontWeight: FontWeight.bold, shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black54,
              )
            ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 45, left: 20),
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
                  size: 33,
                ))),
      ),
    ]);
  }
}
