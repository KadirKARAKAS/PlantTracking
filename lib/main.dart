import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/addPlantsPage/Page/add_plants_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_tracking/plantsHomePage/Page/plants_home_page.dart';
import 'package:plant_tracking/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //listener yeri
  listenerFunction();
  runApp(const MaterialApp(
    home: TestPage(),
  ));
  // await handleAppStart();
  Future.delayed(const Duration(milliseconds: 2000), () async {
    await handleAppStart();
  });
}

Future<void> handleAppStart() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    await FirebaseAuth.instance.signInAnonymously();
    Map<String, dynamic> mapSaveData = {};
    if (Platform.isIOS) {
      mapSaveData = {'Platform': 'iOS'};
    } else {
      mapSaveData = {'Platform': 'Android'};
    }
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(mapSaveData);

    runApp(const MaterialApp(
      home: AddPlantsPage(),
    ));
  } else {
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Plants");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      getdataList.add(doc.data());
    });
    if (getdataList.isEmpty) {
      runApp(const MaterialApp(
        home: AddPlantsPage(),
      ));
    } else {
      runApp(const MaterialApp(
        home: PlantsHomePage(),
      ));
    }
  }
}

listenerFunction() async {
  FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("My Plants")
      .snapshots()
      .listen((querySnapshot) {
    for (var element in querySnapshot.docs) {
      print(element.data()['SlidableBool']);
    }
  });
}
