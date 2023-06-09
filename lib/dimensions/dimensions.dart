import 'package:flutter/material.dart';

class Dimensions {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;

  }
}

// Values below are calculated using dimensions in design layout

// Get the proportionate height for given screeen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = Dimensions.screenHeight!.toDouble();
  return (inputHeight / 791) * screenHeight;
}

// Get the proportionate width for given screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = Dimensions.screenWidth!.toDouble();
  return (inputWidth / 791) * screenWidth;
}