import 'package:flutter/material.dart';
import 'dart:ui';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

//Screen dynamic setting
class ScreenSizeUtils {
  static double baseWidth = 393;

  static Map<String, double> calculateDimensions(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;
    return {
      'ffem': ffem,
      'fem': fem,
      'screenWidth': screenWidth,
    };
  }
}