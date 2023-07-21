import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

import 'plant_water_container_widget.dart';

class AddPlantsPageTextFieldWidget extends StatelessWidget {
  AddPlantsPageTextFieldWidget({super.key});
  final TextEditingController textFieldController1 = TextEditingController();
  final TextEditingController textFieldController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: textFieldController1,
            decoration: const InputDecoration(
              labelText: 'Plant Species',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: textFieldController2,
            decoration: const InputDecoration(
              labelText: 'Plant Size',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How often do you water the plant?",
                style: TextStyle(fontSize: 18, color: Color(0xff747474)),
              )),
          SizedBox(height: 10),
          const PlantWaterContainerWidget(),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                addToDatabase();
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(23)),
                child: const Center(
                    child: Text(
                  "Ekle",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addToDatabase() async {
    String plantSpecies = textFieldController1.text;
    String plantSize = textFieldController2.text;

    final plant = {
      "PlantSpecies": plantSpecies,
      "PlantSize": plantSize,
      "WaterPeriot": selectionWaterContainer,
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

    print(getdataList);
    print("Veri tabanına başarıyla kaydedildi ve getdataList e yazdırıldı.");
  }
}
