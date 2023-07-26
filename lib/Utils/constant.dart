import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

List<Map<String, dynamic>> getdataList = [];
String selectionWaterContainer = "";
String imageURLL = "";
String selectedImagePath = '';
bool adddatacomlate = false;
int selectedContainer = 0;
bool iconVisiable = false;
String waterPeriod = "";
int selectedPlantsIndex = 0;
int waterPeriotgetDataList = 0;
int detailsIndex = 0;
ValueNotifier<int> valueNotifierX = ValueNotifier(0);
bool slidableIconVale = false;
bool slidableContainerColorValue = false;
bool slidableBool = false;
