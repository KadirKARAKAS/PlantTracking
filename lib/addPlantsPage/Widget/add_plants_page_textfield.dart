// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/addPlantsPage/Widget/plant_image_container_widget.dart';
import 'package:plant_tracking/plantsHomePage/Page/plants_home_page.dart';

import 'plant_water_container_widget.dart';

class AddPlantsPageTextFieldWidget extends StatefulWidget {
  const AddPlantsPageTextFieldWidget({super.key});

  @override
  State<AddPlantsPageTextFieldWidget> createState() =>
      _AddPlantsPageTextFieldWidgetState();
}

class _AddPlantsPageTextFieldWidgetState
    extends State<AddPlantsPageTextFieldWidget> {
  final TextEditingController textFieldController1 = TextEditingController();
  final TextEditingController textFieldController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              textfield1(size),
              const SizedBox(height: 10),
              textfield2(size),
              const SizedBox(
                height: 10,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "How often do you water the plant?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff747474),
                    ),
                  )),
              const SizedBox(height: 10),
              const PlantWaterContainerWidget(), // SULAMA ZAMANI CONTAİNER
              const SizedBox(height: 30),
              PlantImageContainerWidget(), //RESİM CONTAİNERI
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    storageKaydetme();
                  },
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xffDEFFDD),
                        borderRadius: BorderRadius.circular(23)),
                    child: const Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff747474)),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            if (adddatacomlate)
              Container(
                width: size.width,
                height: size.height - 200,
                color: Colors.transparent,
              ),
            adddatacomlate
                ? const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  void storageKaydetme() async {
    setState(() {
      adddatacomlate = true;
    });

    if (selectedImagePath.isNotEmpty) {
      List<String> imagePathList = selectedImagePath.split('/');
      await FirebaseStorage.instance
          .ref('PlantImage')
          .child(imagePathList[imagePathList.length - 1])
          .putFile(File(selectedImagePath));
      final imageUrl = await FirebaseStorage.instance
          .ref('PlantImage/${imagePathList[imagePathList.length - 1]}')
          .getDownloadURL();

      imageURLL = imageUrl;
    }
    addToDatabase();
  }

  Container textfield2(Size size) {
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xffDEFFDD),
          borderRadius: BorderRadius.circular(9)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: textFieldController2,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Plant Size',
            hintStyle: TextStyle(fontSize: 20),
            contentPadding: EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      ),
    );
  }

  Container textfield1(Size size) {
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xffDEFFDD),
          borderRadius: BorderRadius.circular(9)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: textFieldController1,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Plant Species',
              hintStyle: TextStyle(fontSize: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 20),
            ),
          )),
    );
  }

  Future<void> addToDatabase() async {
    String plantSpecies = textFieldController1.text;
    String plantSize = textFieldController2.text;

    final plant = {
      "PlantSpecies": plantSpecies,
      "PlantSize": plantSize,
      "WaterPeriot": selectionWaterContainer,
      "ImageUrl": imageURLL,
      "SlidableBool": slidableBool
    };

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Plants")
        .add(plant);

    textFieldController1.clear();
    textFieldController2.clear();

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

      getdataList.add(doc.data());
    });

    setState(() {
      selectedImagePath = '';
      adddatacomlate = false;
    });

    if (!adddatacomlate) {
      if (iconVisiable) {
        Navigator.pop(context);
        Navigator.pop(context);
        valueNotifierX.value += 1;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PlantsHomePage(),
            ));
      }
    }
  }

  Widget getdataListWaterPeriod(int index) {
    return waterPeriotgetDataList = getdataList[index]["Water Periot"];
  }
}
