import 'package:flutter/material.dart';
import 'package:plant_tracking/tasksdetailspage/Widget/taskdetailpagewidget.dart';
import 'package:plant_tracking/tasksdetailspage/Widget/tasktopbar_widget.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff9CD9A1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskTopBarWidget(),
            TaskDetailPageWidget(),
          ],
        ),
      ),
    );
  }
}
