import 'dart:async';

import 'package:courier_frontend/src/models/parcel.dart';
import 'package:courier_frontend/src/screens/parceleditscreen.dart';
import 'package:flutter/material.dart'; // Import your Parcel class // Import ParcelEditScreen
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class ParcelDetailScreen extends StatefulWidget {
  final Parcel parcel;

  ParcelDetailScreen({required this.parcel});

  @override
  _ParcelDetailScreenState createState() => _ParcelDetailScreenState();
}

class _ParcelDetailScreenState extends State<ParcelDetailScreen> {
  late Timer _timer;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startSlideshow() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentImageIndex =
            (_currentImageIndex + 1) % widget.parcel.imageUrls.length;
      });
    });
  }

  void _navigateToEditScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ParcelEditScreen(parcel: widget.parcel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Parcel Detail'),
      // ),
      backgroundColor:const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.4 * fem),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 2.2 * fem),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 13.1 * fem,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 2.9 * fem,
                                  height: 2.9 * fem,
                                  padding: EdgeInsets.fromLTRB(0.8 * fem,
                                      0.8 * fem, 0.8 * fem, 0.8 * fem),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFF3F3F3)),
                                    borderRadius:
                                        BorderRadius.circular(1.9 * fem),
                                  ),
                                  child: Container(
                                    width: 1.4 * fem,
                                    height: 1.4 * fem,
                                    child: SizedBox(
                                      width: 1.4 * fem,
                                      height: 1.4 * fem,
                                      child: SvgPicture.asset(
                                        'assets/vectors/arrow_left_8_x2.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0.8 * fem, 0 * fem, 0.8 * fem),
                                child: Text(
                                  'Sender Details',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    height: 0.1 * fem,
                                    color: Color(0xFF191D31),
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
                  margin: EdgeInsets.fromLTRB(
                      0.6 * fem, 0 * fem, 1.2 * fem, 3.6 * fem),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Full Name',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    height: 1.5,
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
                              padding: EdgeInsets.fromLTRB(
                                  1.2 * fem, 0.9 * fem, 0 * fem, 0.8 * fem),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
                                    child: SizedBox(
                                      width: 0.9 * fem,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0.1 * fem,
                                                0 * fem,
                                                0.2 * fem,
                                                0.1 * fem),
                                            child: SizedBox(
                                              width: 0.6 * fem,
                                              height: 0.6 * fem,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_36_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.9 * fem,
                                            height: 0.5 * fem,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_184_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.9 * fem,),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your name',
                                        hintStyle: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 0.9 * fem,
                                          height: 1.5,
                                          color: Color(0xFFA7A9B7),
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0), // Adjust padding here
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 0.9 * fem,
                                        height: 1.5,
                                        color: Color(0xFF353535),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Phone Number',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    height: 1.5,
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
                              padding: EdgeInsets.fromLTRB(1 * fem, 0.9 * fem, 0 * fem, 0.8 * fem),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
                                    width: 1.2 * fem,
                                    height: 1.3 * fem,
                                    child: SizedBox(
                                      width: 1.2 * fem,
                                      height: 1.3 * fem,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_129_x2.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.9 * fem,),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your number',
                                        hintStyle: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 0.9 * fem,
                                          height: 1.5,
                                          color: Color(0xFFA7A9B7),
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 0.9 * fem,
                                        height: 1.5,
                                        color: Color(0xFF353535),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'City / Province',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    height: 1.5,
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
                              padding: EdgeInsets.fromLTRB(0.9 * fem, 0.9 * fem, 0 * fem, 0.8 * fem),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    width: 1.5 * fem,
                                    height: 1.5 * fem,
                                    child: SizedBox(
                                      width: 1.5 * fem,
                                      height: 1.5 * fem,
                                      child: SvgPicture.asset(
                                        'assets/vectors/location_1_x2.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.9 * fem,),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your city, province',
                                        hintStyle: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 0.9 * fem,
                                          height: 1.5,
                                          color: Color(0xFFA7A9B7),
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 0.9 * fem,
                                        height: 1.5,
                                        color: Color(0xFF353535),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Detail Location',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 1 * fem,
                                  height: 1.5,
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
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.9 * fem, 0.9 * fem, 1.3 * fem, 0.9 * fem),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: 'Type detailed location to make it easier for us to pick up the package',
                                  hintStyle: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 0.9 * fem,
                                    height: 1.5,
                                    color: Color(0xFFA7A9B7),
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                                ),
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.9 * fem,
                                  height: 1.5,
                                  color: Color(0xFF353535),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0.6 * fem, 0 * fem, 1.2 * fem, 4.9 * fem),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF86A40),
                      borderRadius: BorderRadius.circular(1.9 * fem),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 1.1 * fem, 0 * fem, 1.1 * fem),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w800,
                          fontSize: 1 * fem,
                          height: 0.1 * fem,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
