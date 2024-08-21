import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/buttonsclass.dart';
import '../../utils/utils.dart';

class DimensionWidget extends StatelessWidget {
  final double fem;

  const DimensionWidget({required this.fem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.3 * fem, 0 * fem, 1.3 * fem, 2.4 * fem),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Dimension',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w800,
                  fontSize: 1 * fem,
                  height: 0.1 * fem,
                  color: Color(0xFF191D31),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF3F3F3)),
              borderRadius: BorderRadius.circular(0.8 * fem),
              color: Color(0xFFFFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.8 * fem, 0 * fem, 0.8 * fem, 0 * fem),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
                    width: 1.5 * fem,
                    height: 1.5 * fem,
                    child: SvgPicture.asset(
                      'assets/vectors/box_search_3_x2.svg',
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default TextField border
                        hintText: '0', // Placeholder text
                        hintStyle: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w400,
                          fontSize: 0.9 * fem,
                          color: Color(0xFFA7A9B7),
                          height: 0.1 * fem,
                        ),
                      ),
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w400,
                        fontSize: 0.9 * fem,
                        color: Color(0xFFA7A9B7),
                        height: 0.1 * fem,
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
                    child: Text(
                      'Kg',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w500,
                        fontSize: 0.9 * fem,
                        color: Color(0xFF191D31),
                        height: 0.1 * fem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 3.8 * fem,),
          CheckButtonWidget(
            fem: fem,
            label: 'Check',
            color: Color(0xFFFD683D), // Button color
            onPressed: () {
              // Define what happens when the button is pressed
              print('Check button pressed from DimensionWidget');
            },
          ),
        ],
      ),
    );
  }
}
