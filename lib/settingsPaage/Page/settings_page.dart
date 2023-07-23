import 'package:flutter/material.dart';
import 'package:plant_tracking/settingsPaage/Widget/settings_page_container_widget.dart';
import 'package:plant_tracking/settingsPaage/Widget/topbar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff9CD9A1),
        body: Column(
          children: [
            TopBarWidgetSetting(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SettingsPageContainerWidget(),
                ],
              ),
            ),
          ],
        ));
  }
}
