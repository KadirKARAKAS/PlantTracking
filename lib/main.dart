import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/addPlantsPage/Page/add_plants_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await handleAppStart();
  runApp(const MaterialApp(
    home: AddPlantsPage(),
  ));
}

Future<void> handleAppStart() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    await FirebaseAuth.instance.signInAnonymously();

    // String platform = "ios";
    // if (!Platform.isIOS) {
    //   platform = "android";
    // }
  } else {
    // final userRef = FirebaseFirestore.instance
    //     .collection("Users")
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection("My Plants");

    // final querySnapshot = await userRef.get();
    // getdataList.clear();
    // querySnapshot.docs.forEach((doc) {
    //   getdataList.add(doc.data());
    // });
    // runApp(const MaterialApp(
    //   home: PlantsHomePage(),
    // ));
  }
}
