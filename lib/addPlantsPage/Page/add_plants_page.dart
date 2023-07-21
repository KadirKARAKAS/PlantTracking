import 'package:flutter/material.dart';
import 'package:plant_tracking/addPlantsPage/Widget/add_plants_page_textfield.dart';
import 'package:plant_tracking/addPlantsPage/Widget/topbar_widget.dart';

class AddPlantsPage extends StatefulWidget {
  const AddPlantsPage({super.key});

  @override
  State<AddPlantsPage> createState() => _AddPlantsPageState();
}

class _AddPlantsPageState extends State<AddPlantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBarWidget(),
          AddPlantsPageTextFieldWidget(),
        ],
      ),
    );
  }
}
