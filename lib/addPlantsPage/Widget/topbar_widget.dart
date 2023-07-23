import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class TopBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 80,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: Center(
            child: Text(
              "Add Plants ",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (iconVisiable)
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 32,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
