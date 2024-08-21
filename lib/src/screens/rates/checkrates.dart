// import 'package:courier_frontend/src/screens/rates/packagedimensions.dart';
// import 'package:courier_frontend/src/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../utils/utils.dart';
//
//
// class CheckRates extends StatelessWidget {
//   const CheckRates({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Map<String, double> dimensions =
//     ScreenSizeUtils.calculateDimensions(context);
//     double fem = dimensions['fem']!;
//     return Scaffold(
//       //backgroundColor: const Color(0xFFFFFFFF),
//       body:  Container(
//           decoration: const BoxDecoration(
//             color: AppColors.scaffoldBackgroundColor,
//           ),
//           child: Container(
//             padding: EdgeInsets.fromLTRB(1.5*fem, 0.9*fem, 0.9*fem, 0.5*fem),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 //From here add to SliverAppBar
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0*fem, 2.3*fem, 0*fem, 2.2*fem),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: SizedBox(
//                           width: 12.7*fem,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 2.9*fem,
//                                 height: 2.9*fem,
//                                 padding: EdgeInsets.fromLTRB(0.8*fem, 0.8*fem, 0.8*fem, 0.8*fem),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xFFF3F3F3)),
//                                   borderRadius: BorderRadius.circular(1.9*fem),
//                                 ),
//                                 child: Container(
//                                   width: 1.4*fem,
//                                   height: 1.4*fem,
//                                   child: SizedBox(
//                                     width: 1.4*fem,
//                                     height: 1.4*fem,
//                                     child: SvgPicture.asset(
//                                       'assets/vectors/arrow_left_23_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0*fem, 0.8*fem, 0*fem, 0.8*fem),
//                                 child: Text(
//                                   'Check Rates',
//                                   style: GoogleFonts.getFont(
//                                     'Roboto Condensed',
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 1*fem,
//                                     height: 0.1*fem,
//                                     color: Color(0xFF191D31),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0.8*fem, 0*fem, 1.5*fem, 1.9*fem),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width:5.0*fem,
//                         child: Container(
//                           margin: EdgeInsets.fromLTRB(0*fem, 1.4*fem, 0.9*fem, 1*fem),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
//                                 width: 1.6*fem,
//                                 height: 1.6*fem,
//                                 child: SizedBox(
//                                   width: 1.6*fem,
//                                   height: 1.6*fem,
//                                   child: SvgPicture.asset(
//                                     'assets/vectors/record_circle_9_x2.svg',
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0.6 * fem, 0 * fem, 0.9 * fem, 0.2 * fem),
//                                 child: SizedBox(
//                                   width: 0.9 * fem,
//                                   height: 2.4 * fem,
//                                   child: Transform.scale(
//                                     scale: 2.5, // Zoom the SVG by 200%
//                                     child: Transform.rotate(
//                                       angle: -90 * (3.14159265359 / 180), // Convert degrees to radians
//                                       child: SvgPicture.asset(
//                                         'assets/vectors/line_14_stroke_1_x2.svg',
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0.1*fem, 0*fem, 0.4*fem, 0*fem),
//                                 width: 1.1*fem,
//                                 height: 1.3*fem,
//                                 child: SizedBox(
//                                   width: 1.1*fem,
//                                   height: 1.3*fem,
//                                   child: SvgPicture.asset(
//                                     'assets/vectors/vector_178_x2.svg',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.9 * fem),
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Color(0xFFF3F3F3)),
//                                 borderRadius: BorderRadius.circular(0.8 * fem),
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.fromLTRB(0.9 * fem, 0 * fem, 0 * fem, 0 * fem),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: 'Pick up Location',
//                                     hintStyle: GoogleFonts.getFont(
//                                       'Roboto Condensed',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 0.9 * fem,
//                                       color: Color(0xFFA7A9B7),
//                                     ),
//                                     suffixIcon: Padding(
//                                       padding: EdgeInsets.all(0.0), // Adjust icon padding if necessary
//                                       child: Transform.scale(
//                                         scale: 0.5,
//                                         child: SvgPicture.asset(
//                                           'assets/vectors/gps_4_x2.svg',
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Color(0xFFF3F3F3)),
//                                 borderRadius: BorderRadius.circular(0.8 * fem),
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.fromLTRB(0.9 * fem, 0 * fem, 0 * fem, 0 * fem),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: 'Package Destination',
//                                     hintStyle: GoogleFonts.getFont(
//                                       'Roboto Condensed',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 0.9 * fem,
//                                       color: Color(0xFFA7A9B7),
//                                     ),
//                                     suffixIcon: Padding(
//                                       padding: EdgeInsets.all(0.0), // Adjust icon padding if necessary
//                                       child: Transform.scale(
//                                         scale: 0.5,
//                                         child: SvgPicture.asset(
//                                           'assets/vectors/gps_3_x2.svg',
//                                           width: 1.5 * fem,
//                                           height: 1.5 * fem,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //From here add to SliverList
//                 DimensionWidget(fem: fem),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }




import 'package:courier_frontend/src/screens/rates/packagedimensions.dart';
import 'package:courier_frontend/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/utils.dart';

class CheckRates extends StatelessWidget {
  const CheckRates({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Convert top Container to SliverAppBar
          SliverAppBar(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            pinned: true,
            expandedHeight: 17.0 * fem,
            leading: IconButton(
              icon: Container(
                width: 2.9 * fem,
                height: 2.9 * fem,
                padding: EdgeInsets.fromLTRB(0.8 * fem, 0.8 * fem, 0.8 * fem, 0.8 * fem),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF3F3F3)),
                  borderRadius: BorderRadius.circular(1.9 * fem),
                ),
                child: SvgPicture.asset(
                  'assets/vectors/arrow_left_23_x2.svg',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Go back to the previous screen
              },
            ),
            title: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0.8 * fem, 0 * fem, 0.8 * fem),
              child: Text(
                'Check Rates',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w800,
                  fontSize: 1 * fem,
                  height: 0.1 * fem,
                  color: Color(0xFF191D31),
                ),
              ),
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.5 * fem),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.8 * fem, 7 * fem, 1.5 * fem, 1.9 * fem),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 5.0 * fem,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 1.4 * fem, 0.9 * fem, 1 * fem),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    width: 1.6 * fem,
                                    height: 1.6 * fem,
                                    child: SvgPicture.asset(
                                      'assets/vectors/record_circle_9_x2.svg',
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.6 * fem, 0 * fem, 0.9 * fem, 0.2 * fem),
                                    child: SizedBox(
                                      width: 0.9 * fem,
                                      height: 2.4 * fem,
                                      child: Transform.scale(
                                        scale: 2.5, // Zoom the SVG by 200%
                                        child: Transform.rotate(
                                          angle: -90 * (3.14159265359 / 180), // Convert degrees to radians
                                          child: SvgPicture.asset(
                                            'assets/vectors/line_14_stroke_1_x2.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.1 * fem, 0 * fem, 0.4 * fem, 0 * fem),
                                    width: 1.1 * fem,
                                    height: 1.3 * fem,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_178_x2.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.9 * fem),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFFF3F3F3)),
                                    borderRadius: BorderRadius.circular(0.8 * fem),
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0.9 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Pick up Location',
                                        hintStyle: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 0.9 * fem,
                                          color: Color(0xFFA7A9B7),
                                        ),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: SvgPicture.asset(
                                              'assets/vectors/gps_4_x2.svg',
                                            ),
                                          ),
                                        ),
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
                                    padding: EdgeInsets.fromLTRB(0.9 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Package Destination',
                                        hintStyle: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 0.9 * fem,
                                          color: Color(0xFFA7A9B7),
                                        ),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: SvgPicture.asset(
                                              'assets/vectors/gps_3_x2.svg',
                                              width: 1.5 * fem,
                                              height: 1.5 * fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Convert remaining content to SliverList
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: DimensionWidget(fem: fem),
                ), // Your custom widget
              ],
            ),
          ),
        ],
      ),
    );
  }
}
