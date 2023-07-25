import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsDetailListPage/Page/plants_detail_list_page.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xff9CD9A1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const TopBarWidget(),
              const TextWidget(text: 'Tasks'),
              const NotificationWidget(),
              InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlantsDetailListPage(),
                      ));
                },
                child: const TextWidget(
                  text: "Plants",
                ),
              ),
              const PlantsImageContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
