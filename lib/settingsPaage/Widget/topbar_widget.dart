import 'package:flutter/material.dart';

class TopBarWidgetSetting extends StatelessWidget {
  const TopBarWidgetSetting({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: 80,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 40, bottom: 40),
        child: Center(
          child: Text(
            "Settings ",
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black54,
                )
              ],
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40, left: 20),
        child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 32,
                ))),
      ),
    ]);
  }
}
