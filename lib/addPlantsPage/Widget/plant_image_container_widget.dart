import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plant_tracking/Utils/constant.dart';

class PlantImageContainerWidget extends StatefulWidget {
  PlantImageContainerWidget({Key? key}) : super(key: key);

  @override
  State<PlantImageContainerWidget> createState() =>
      _PlantImageContainerWidgetState();
}

class _PlantImageContainerWidgetState extends State<PlantImageContainerWidget> {
  String imagePath = '';
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          onTapFunction();
        },
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 1.89,
                height: MediaQuery.of(context).size.height / 2.89,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xffBFEDBE),
                ),
                child: selectedImagePath == ""
                    ? plantsIconPhoto()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.file(
                          File(selectedImagePath),
                          fit: BoxFit.cover,
                        ),
                      )),
          ],
        ),
      );
    });
  }

  Padding plantsIconPhoto() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        width: 90,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/flower.png")),
        ),
      ),
    );
  }

  storageStatusControl() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request().then((value) async {
        final XFile? xFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (xFile != null) {
          imagePath = xFile.path;
          setState(() {});
        }
      });
    }
  }

  onTapFunction() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath = image.path;
      setState(() {});
    }
  }
}
