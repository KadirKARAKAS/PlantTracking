import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsDetailPage/Widget/plants_details_data.dart';
import 'package:plant_tracking/plantsDetailPage/Widget/topbar_widget_detail.dart';

class PlantsDetailPage extends StatefulWidget {
  const PlantsDetailPage({super.key});

  @override
  State<PlantsDetailPage> createState() => _PlantsDetailPageState();
}

class _PlantsDetailPageState extends State<PlantsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff9CD9A1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopBarDetailWidget(),
              PlansDetailsData(),
            ],
          ),
        ),
      ),
    );
  }
}
