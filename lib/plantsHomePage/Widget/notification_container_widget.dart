import 'package:flutter/material.dart';

class NotificationContainerWidget extends StatefulWidget {
  const NotificationContainerWidget({super.key});

  @override
  State<NotificationContainerWidget> createState() =>
      _NotificationContainerWidgetState();
}

class _NotificationContainerWidgetState
    extends State<NotificationContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 67,
            decoration: BoxDecoration(
              color: const Color(0xffDEFFDD),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const Positioned(
            top: 20,
            right: 15,
            child: Icon(Icons.water_drop),
          ),
        ],
      ),
    );
  }
}
