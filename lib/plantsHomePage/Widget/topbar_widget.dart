import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: 80,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 40, bottom: 30),
        child: Center(
          child: Text(
            "Add Plants ",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 45,
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 32,
                ))),
      ),
    ]);
  }
}
