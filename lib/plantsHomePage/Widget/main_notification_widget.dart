import 'package:flutter/material.dart';
import 'package:plant_tracking/plantsHomePage/Widget/notification_container_widget.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return const NotificationContainerWidget();
  }
}
