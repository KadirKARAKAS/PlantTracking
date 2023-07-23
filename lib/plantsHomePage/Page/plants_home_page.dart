import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsHomePage/Widget/main_notification_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/plants_image_container_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/text_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/topbar_widget.dart';

class PlantsHomePage extends StatefulWidget {
  const PlantsHomePage({super.key});

  @override
  State<PlantsHomePage> createState() => _PlantsHomePageState();
}

class _PlantsHomePageState extends State<PlantsHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff9CD9A1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopBarWidget(),
              TextWidget(text: 'Tasks'),
              NotificationWidget(),
              TextWidget(text: "Plants"),
              PlantsImageContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
