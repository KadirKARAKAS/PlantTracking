import 'package:flutter/material.dart';
import 'package:plant_tracking/addPlantsPage/Page/add_plants_page.dart';

import '../../Utils/constant.dart';

class SettingsPageContainerWidget extends StatefulWidget {
  const SettingsPageContainerWidget({super.key});

  @override
  State<SettingsPageContainerWidget> createState() =>
      _SettingsPageContainerWidgetState();
}

class _SettingsPageContainerWidgetState
    extends State<SettingsPageContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        iconVisiable = true;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPlantsPage(),
            ));
      },
      child: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
            color: const Color(0xffDEFFDD),
            borderRadius: BorderRadius.circular(9)),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add new plant",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
