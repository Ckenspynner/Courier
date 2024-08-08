import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/parcel.dart';
import 'trackpath.dart';

class Details extends StatelessWidget {
  final Parcel parcel;

  const Details({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.9 * fem),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDFE2EB),
                        borderRadius: BorderRadius.circular(0.6 * fem),
                      ),
                      child: Container(
                        width: 3.8 * fem,
                        height: 0.4 * fem,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.9 * fem),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.8 * fem, 0.3 * fem),
                          child: Text(
                            'Your Package on The Way',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w800,
                              fontSize: 1.1 * fem,
                              height: 0.1 * fem,
                              color: Color(0xFF191D31),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.9 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'Arriving at pick up point in 2 mins',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 0.9 * fem,
                              height: 0.1 * fem,
                              color: Color(0xFFA7A9B7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.3 * fem, 0.8 * fem),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                    ),
                    child: Container(
                      width: 20.4 * fem,
                      height: 0.1 * fem,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.9 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4 * fem),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/image.png',
                                ),
                              ),
                            ),
                            child: Container(
                              height: 2.9 * fem,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 0 * fem, 0 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.3 * fem),
                                    child: Text(
                                      'Harry Johnson',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 0.9 * fem,
                                        height: 0.1 * fem,
                                        color: Color(0xFF191D31),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.1 * fem, 0 * fem, 0.1 * fem, 0 * fem),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem, 0.3 * fem, 0.4 * fem, 0.3 * fem),
                                            width: 0.7 * fem,
                                            height: 0.7 * fem,
                                            child: SizedBox(
                                              width: 0.7 * fem,
                                              height: 0.7 * fem,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_151_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '4.9',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 0.8 * fem,
                                              height: 0.1 * fem,
                                              color: Color(0xFFA7A9B7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0.6 * fem, 0 * fem, 0.6 * fem),
                                child: SizedBox(
                                  width: 3.8 * fem,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 1 * fem, 0.1 * fem),
                                        width: 1.2 * fem,
                                        height: 1.3 * fem,
                                        child: SizedBox(
                                          width: 1.2 * fem,
                                          height: 1.3 * fem,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_1_x2.svg',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 1.5 * fem,
                                        height: 1.5 * fem,
                                        child: SizedBox(
                                          width: 1.5 * fem,
                                          height: 1.5 * fem,
                                          child: SvgPicture.asset(
                                            'assets/vectors/message_notif_5_x2.svg',
                                          ),
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
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.3 * fem, 0 * fem),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F3F3),
                    ),
                    child: Container(
                      width: 20.4 * fem,
                      height: 0.1 * fem,
                    ),
                  ),
                ),
                TrackPath(parcel: parcel), // Pass the Parcel object here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
