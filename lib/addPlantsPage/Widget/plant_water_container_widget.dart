import 'package:flutter/material.dart';
import 'package:plant_tracking/Utils/constant.dart';

class PlantWaterContainerWidget extends StatefulWidget {
  const PlantWaterContainerWidget({super.key});

  @override
  _PlantWaterContainerWidgetState createState() =>
      _PlantWaterContainerWidgetState();
}

class _PlantWaterContainerWidgetState extends State<PlantWaterContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        waterContainer(size / 1.3, "Once Daily", () {
          selectionWaterContainer = 0;
          setState(() {
            selectedContainer = 0;
          });
        },
            selectedContainer ==
                0), // Konteyner seçildiğinde, isSelected değeri true olur.
        const SizedBox(width: 5),
        waterContainer(size / 1.3, "Twice Daily", () {
          selectionWaterContainer = 1;
          setState(() {
            selectedContainer =
                1; // Seçilen konteynerin indeksi 1 olarak güncellenir.
          });
        },
            selectedContainer ==
                1), // Konteyner seçildiğinde, isSelected değeri true olur.
        const SizedBox(width: 5),
        waterContainer(size, "Once or Twice a Week", () {
          selectionWaterContainer = 2;
          setState(() {
            selectedContainer =
                2; // Seçilen konteynerin indeksi 2 olarak güncellenir.
          });
        },
            selectedContainer ==
                2), // Konteyner seçildiğinde, isSelected değeri true olur.
      ],
    );
  }

  Widget waterContainer(
    Size size,
    String containerText,
    VoidCallback onTap,
    bool isSelected,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 3,
        height: 30,
        decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xffBFEDBE) : const Color(0xffBFEDBE),
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all()
                : Border.all(
                    width:
                        0)), // Konteyner seçildiğinde sınır çizgisi gösterilir.
        child: Center(
          child: Text(
            containerText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff747474),
            ),
          ),
        ),
      ),
    );
  }
}
