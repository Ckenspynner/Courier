import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double ffem = MediaQuery.of(context).size.width / baseWidth;
    double screenwidth = MediaQuery.of(context).size.width;
    double fem = ffem * 15;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(2 * fem),
          ),
          child: Container(
            width: 2.5 * fem,
            height: 2.5 * fem,
            padding: EdgeInsets.fromLTRB(0.1 * fem, 0.1 * fem, 0.1 * fem, 0.1 * fem),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.1 * fem),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ellipse_8.png'),
                ),
              ),
              child: Container(
                width: 2.3 * fem,
                height: 2.3 * fem,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.4 * fem, 0 * fem),
                  child: Text(
                    'Noida Sector 75',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.8 * fem,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
                  child: SizedBox(
                    width: 0.3 * fem,
                    height: 0.2 * fem,
                    child: SvgPicture.asset(
                      'assets/vectors/vector_2_x2.svg',
                    ),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: 0.6,
              child: Text(
                'Golf city, Plot 8, Sector 75',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 0.6 * fem,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Positioned(
              top: -0.8 * fem,
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  width: 2.5 * fem,
                  height: 2.5 * fem,
                ),
              ),
            ),
            Container(
              width: 2.5 * fem,
              height: 2.5 * fem,
              padding: EdgeInsets.fromLTRB(0.8 * fem, 0.8 * fem, 0.8 * fem, 0.8 * fem),
              child: Container(
                width: 0.8 * fem,
                height: 0.9 * fem,
                child: SizedBox(
                  width: 0.8 * fem,
                  height: 0.9 * fem,
                  child: SvgPicture.asset(
                    'assets/vectors/vector_118_x2.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
