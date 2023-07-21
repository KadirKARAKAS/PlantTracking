import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController1 = TextEditingController();
    final TextEditingController textFieldController2 = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xffDEFFDD), borderRadius: BorderRadius.circular(9)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: textFieldController1,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Plant Species',
                  hintStyle: TextStyle(fontSize: 20),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              )),
        ),
        const SizedBox(height: 10),
        Container(
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xffDEFFDD), borderRadius: BorderRadius.circular(9)),
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
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
