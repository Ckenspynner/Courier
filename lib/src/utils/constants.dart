import 'package:flutter/material.dart';

class AppColors {
  //Home
  static const Color primaryColor = Color(0xFFFD683D);
  static const Color secondaryColor = Color(0xFFFF965A);
  static const Color scaffoldBackgroundColor = Color(0xFFFCFCFC);
  static const Color dividerColor = Color(0x33FFFFFF);
  static const Color placeholderColor = Color(0xFFE0E0E0);

  //Top Nav
  static const Color borderColor = Color(0x33EDEDED); // Border color
  static const Color containerColor = Color(0xFFFFFFFF); // Container background color
  static const Color shadowColor = Color(0x0F767676); // Shadow color
  static const Color textColor = Color(0xFF353535); // Text color

  //Recentshipment
  static const Color borderColor1 = Color(0x99EDEDED); // Border color
  static const Color textColor1 = Color(0xFF353535); // Text color
  static const Color subtitleColor = Color(0xFFABABAB); // Subtitle color
}
class AppDecorations {
  static const BoxDecoration appBarDecoration = BoxDecoration(
    color: AppColors.primaryColor,
    border: Border(
      bottom: BorderSide(
        color: AppColors.dividerColor,
        width: 0.3,
      ),
    ),
  );

  static BoxDecoration floatingActionButtonDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment(-2.754, -1.214),
      end: Alignment(1.431, 1.75),
      colors: <Color>[AppColors.secondaryColor, AppColors.primaryColor],
      stops: <double>[0, 1],
    ),
    borderRadius: BorderRadius.circular(30.0),
  );
}

class AppDimensions {
  static const double baseWidth = 393; // Base width for calculations
}
