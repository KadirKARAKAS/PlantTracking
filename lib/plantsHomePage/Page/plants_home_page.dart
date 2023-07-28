import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/plantsDetailListPage/Page/plants_detail_list_page.dart';
import 'package:plant_tracking/plantsHomePage/Widget/main_notification_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/plants_image_container_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/text_widget.dart';
import 'package:plant_tracking/plantsHomePage/Widget/topbar_widget.dart';
import 'package:plant_tracking/tasksdetailspage/Page/task_detail_page.dart';

class PlantsHomePage extends StatefulWidget {
  const PlantsHomePage({super.key});

  @override
  State<PlantsHomePage> createState() => _PlantsHomePageState();
}

class _PlantsHomePageState extends State<PlantsHomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () async {
      valueNotifierX.value += 1;
      final userRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("My Plants");

      final querySnapshot = await userRef.get();
      getdataList.clear();
      querySnapshot.docs.forEach((doc) async {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("My Plants")
            .doc(doc.id)
            .update({'docId': doc.id});
        print('DOC ID UPDATE AFTER:::${doc.id}');
        getdataList.add(doc.data());
      });
    });

    super.initState();
  }

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
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskDetailsPage()));
                  },
                  child: const TextWidget(text: 'Tasks')),
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
