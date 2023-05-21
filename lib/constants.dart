import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Constants {
  //Primary color
  static var primaryColor = const Color(0xff296e48);
  static var blackColor = Colors.black54;

  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne =
      "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo =
      "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree =
      "Find almost all types of plants that you like here.";
}

final db = FirebaseAuth.instance;
Color kDarkGreenColor = const Color(0xFF184A2C);
Color kGinColor = const Color(0xFFE5F0EA);
Color kSpiritedGreen = const Color(0xFFC1DFCB);
Color kFoamColor = const Color(0xFFEBFDF2);
Color kGreyColor = Colors.grey.shade600;

