import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffBFEDBE),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                height: 450,
                color: Colors.transparent,
                child: Lottie.asset("assets/splash.json", fit: BoxFit.cover),
              ),
              SizedBox(height: 50),
              textColumn(),
            ],
          ),
        ));
  }

  Widget textColumn() {
    return Container(
      color: Colors.transparent,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Plant",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(color: Colors.black45, offset: Offset(-2, 2))
                ]),
          ),
          Text(
            "Tracking",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(color: Colors.black45, offset: Offset(-2, 2))
                ]),
          ),
        ],
      ),
    );
  }
}
