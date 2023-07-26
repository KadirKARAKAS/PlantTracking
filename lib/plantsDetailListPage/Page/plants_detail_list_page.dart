import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsDetailListPage/Widget/detail_Page_listview_widget.dart';
import 'package:plant_tracking/plantsDetailListPage/Widget/detail_topbar_widget.dart';

class PlantsDetailListPage extends StatefulWidget {
  const PlantsDetailListPage({super.key});

  @override
  State<PlantsDetailListPage> createState() => _PlantsDetailListPageState();
}

class _PlantsDetailListPageState extends State<PlantsDetailListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff9CD9A1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailTopBarWidget(topBarTitle: "Plants"),
            DetailPageListviewWidget(),
          ],
        ),
      ),
    );
  }
}
