import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsHomePage/Page/plants_home_page.dart';

class TaskTopBarWidget extends StatelessWidget {
  const TaskTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: 80,
        color: const Color(0xff9CD9A1),
      ),
      const Padding(
        padding: EdgeInsets.only(
          top: 40,
        ),
        child: Center(
          child: Text(
            "Tasks",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 45, left: 10),
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
