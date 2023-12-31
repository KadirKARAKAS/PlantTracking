import 'package:flutter/material.dart';
import 'package:plant_tracking/settingsPaage/Page/settings_page.dart';

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
        padding: const EdgeInsets.only(
          top: 45,
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
                child: const Icon(
                  Icons.menu,
                  size: 32,
                ))),
      ),
    ]);
  }
}
