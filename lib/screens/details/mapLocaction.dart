import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393; // Set your base width for calculations
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/rectangle_116.png',
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 27.8*fem),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.4*fem),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40A7A9B7),
                      offset: Offset(0*fem, 0.3*fem),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(2.1*fem, 0.9*fem, 0.9*fem, 1.5*fem),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.1*fem, 0*fem, 0.1*fem, 0*fem),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 18.4*fem,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 1.4*fem,
                                  height: 1.4*fem,
                                  child: SizedBox(
                                    width: 1.4*fem,
                                    height: 1.4*fem,
                                    child: SvgPicture.asset(
                                      'assets/vectors/arrow_left_14_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0.1*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'Detail Location',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 1*fem,
                                      height: 0.1*fem,
                                      color: Color(0xFF191D31),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0.2*fem, 0*fem, 0.2*fem),
                                  child: SizedBox(
                                    width: 0.2*fem,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.2*fem),
                                          child: SizedBox(
                                            width: 0.2*fem,
                                            height: 0.2*fem,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_37_x2.svg',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.2*fem),
                                          child: SizedBox(
                                            width: 0.2*fem,
                                            height: 0.2*fem,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_119_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.2*fem,
                                          height: 0.2*fem,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_130_x2.svg',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.8*fem, 0*fem, 0*fem, 0*fem),
                child: SizedBox(
                  width: 15.4*fem,
                  height: 14.3*fem,
                  child: SvgPicture.asset(
                    'assets/vectors/container_16_x2.svg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
