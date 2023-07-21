import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';
import 'package:plant_tracking/addPlantsPage/Widget/plant_image_container_widget.dart';
import 'package:plant_tracking/main.dart';
import 'package:plant_tracking/test.dart';

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
                    style: TextStyle(fontSize: 18, color: Color(0xff747474)),
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
                    setState(() {
                      adddatacomlate = true;
                    });

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
        Container(
          height: 600,
          child: Align(
            alignment: Alignment.center,
            child: adddatacomlate
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
          ),
        ),
      ],
    );
  }

  void storageKaydetme() async {
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
          color: Color(0xffDEFFDD), borderRadius: BorderRadius.circular(9)),
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
      "İmageUrl": imageURLL,
    };

    await FirebaseFirestore.instance
        .collection("PlantSpecies")
        .doc(plantSpecies)
        .set(plant);

    textFieldController1.clear();
    textFieldController2.clear();

    await FirebaseFirestore.instance
        .collection("PlantSpecies")
        .doc(plantSpecies)
        .get()
        .then((doc) {
      Map<String, dynamic> xMap = doc.data() as Map<String, dynamic>;
      getdataList.addAll([xMap]);
    });

    selectedImagePath = '';

    adddatacomlate = false;
    if (adddatacomlate = false) {
      print("objeAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAct");
    }
    setState(() {});
  }
}
