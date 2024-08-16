import 'package:courier_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;

    return Container(
      margin:
      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.3 * fem, 0 * fem),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3F3),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 0.1 * fem,
        ),
      ),
    );
  }
}