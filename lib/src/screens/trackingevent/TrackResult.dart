// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class TrackResult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // double fem = MediaQuery.of(context).size.width / 393;
//     double baseWidth = 393; // Set your base width for calculations
//     double screenWidth = MediaQuery.of(context).size.width;
//     double ffem = screenWidth / baseWidth;
//     double fem = ffem * 15;
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color(0xFFFFFFFF),
//         ),
//         child: Container(
//           padding:
//               EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.6 * fem),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin:
//                     EdgeInsets.fromLTRB(0 * fem, 4.0 * fem, 0 * fem, 1.9 * fem),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width/1.8,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 2.5 * fem,
//                               // Increase the outer container size
//                               height: 2.5 * fem,
//                               // Increase the outer container size
//                               padding: EdgeInsets.fromLTRB(
//                                   0.5 * fem, 0.5 * fem, 0.5 * fem, 0.5 * fem),
//                               // Adjust padding as needed
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: const Color(0xFFF3F3F3)),
//                                 borderRadius: BorderRadius.circular(
//                                     2.0 * fem), // Adjust border radius
//                               ),
//                               child: SizedBox(
//                                 width: 2.0 * fem,
//                                 // Increase inner container size
//                                 height: 2.0 * fem,
//                                 // Increase inner container size
//                                 child: SizedBox(
//                                   width: 2.0 * fem, // Increase SVG size
//                                   height: 2.0 * fem, // Increase SVG size
//                                   child: SvgPicture.asset(
//                                     'assets/vectors/arrow_left_12_x2.svg',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(
//                                   0 * fem, 0.8 * fem, 0 * fem, 0.8 * fem),
//                               child: Text(
//                                 'Parcel Tracking',
//                                 style: GoogleFonts.getFont(
//                                   'Roboto Condensed',
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 1 * fem,
//                                   height: 0.1 * fem,
//                                   color: const Color(0xFF191D31),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding:
//                 EdgeInsets.fromLTRB(0.4 * fem, 0 * fem, 1.2 * fem, 0.6 * fem),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.fromLTRB(
//                         0.9 * fem, 0.9 * fem, 0.9 * fem, 0.8 * fem),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(0.8 * fem),
//                       borderSide: const BorderSide(color: Color(0xFF1D272F)),
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFF9F9F9),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.all(0.9 * fem),
//                       child: SvgPicture.asset(
//                         'assets/vectors/search_normal_3_x2.svg',
//                         width: 1.5 * fem,
//                         height: 1.5 * fem,
//                       ),
//                     ),
//                     suffixIcon: Padding(
//                       padding: EdgeInsets.all(0.9 * fem),
//                       child: SvgPicture.asset(
//                         'assets/vectors/scan_10_x2.svg',
//                         width: 1.5 * fem,
//                         height: 1.5 * fem,
//                       ),
//                     ),
//                     hintText: '152634',
//                     hintStyle: GoogleFonts.getFont(
//                       'Roboto Condensed',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 0.9 * fem,
//                       color: const Color(0xFF191D31),
//                     ),
//                   ),
//                   style: GoogleFonts.getFont(
//                     'Roboto Condensed',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 0.9 * fem,
//                     color: const Color(0xFF191D31),
//                   ),
//                 ),
//               ),
//
//
//
//
//               Container(
//                 margin: EdgeInsets.fromLTRB(
//                     0.2 * fem, 0 * fem, 1.2 * fem, 1.3 * fem),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(
//                           0 * fem, 0.1 * fem, 0.7 * fem, 0.1 * fem),
//                       child: SizedBox(
//                         width: 16.8 * fem,
//                         child: Text(
//                           'Tracking History',
//                           style: GoogleFonts.getFont(
//                             'Roboto Condensed',
//                             fontWeight: FontWeight.w800,
//                             fontSize: 1 * fem,
//                             height: 0.1 * fem,
//                             color: Color(0xFF191D31),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'Delete All',
//                       style: GoogleFonts.getFont(
//                         'Roboto Condensed',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 0.9 * fem,
//                         height: 0.1 * fem,
//                         color: Color(0xFFFD683D),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ListView.builder(
//                 padding: EdgeInsets.fromLTRB(0.3 * fem, 0 * fem, 1.4 * fem, 31.4 * fem),
//                 itemCount: 12, // Original 2 entries + 10 more
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//                                   width: 1.5 * fem,
//                                   height: 1.5 * fem,
//                                   child: SizedBox(
//                                     width: 1.5 * fem,
//                                     height: 1.5 * fem,
//                                     child: SvgPicture.asset(
//                                       'assets/vectors/clock_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//                                   child: Text(
//                                     'MM09130520', // Placeholder, replace as needed
//                                     style: GoogleFonts.getFont(
//                                       'Roboto Condensed',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 0.9 * fem,
//                                       height: 0.1 * fem,
//                                       color: Color(0xFF151B33),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//                               width: 0.7 * fem,
//                               height: 0.7 * fem,
//                               child: SizedBox(
//                                 width: 0.7 * fem,
//                                 height: 0.7 * fem,
//                                 child: SvgPicture.asset(
//                                   'assets/vectors/group_338241_x2.svg',
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF3F3F3),
//                           ),
//                           child: Container(
//                             width: 20.4 * fem,
//                             height: 0.1 * fem,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.2 * fem, 0 * fem),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//                                   width: 1.5 * fem,
//                                   height: 1.5 * fem,
//                                   child: SizedBox(
//                                     width: 1.5 * fem,
//                                     height: 1.5 * fem,
//                                     child: SvgPicture.asset(
//                                       'assets/vectors/clock_2_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//                                   child: Text(
//                                     '84563217954', // Placeholder, replace as needed
//                                     style: GoogleFonts.getFont(
//                                       'Roboto Condensed',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 0.9 * fem,
//                                       height: 0.1 * fem,
//                                       color: Color(0xFF151B33),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//                               width: 0.7 * fem,
//                               height: 0.7 * fem,
//                               child: SizedBox(
//                                 width: 0.7 * fem,
//                                 height: 0.7 * fem,
//                                 child: SvgPicture.asset(
//                                   'assets/vectors/group_338242_x2.svg',
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.6 * fem, 0 * fem),
//                         width: 8.4 * fem,
//                         height: 0.3 * fem,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFF000000),
//                             borderRadius: BorderRadius.circular(6.3 * fem),
//                           ),
//                           child: Container(
//                             width: 8.4 * fem,
//                             height: 0.3 * fem,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//
//               // Container(
//               //   margin: EdgeInsets.fromLTRB(
//               //       0.3 * fem, 0 * fem, 1.4 * fem, 31.4 * fem),
//               //   child: Column(
//               //     mainAxisAlignment: MainAxisAlignment.start,
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: [
//               //       Container(
//               //         margin: EdgeInsets.fromLTRB(
//               //             0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
//               //         child: Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Row(
//               //               mainAxisAlignment: MainAxisAlignment.start,
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 Container(
//               //                   margin: EdgeInsets.fromLTRB(
//               //                       0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//               //                   width: 1.5 * fem,
//               //                   height: 1.5 * fem,
//               //                   child: SizedBox(
//               //                     width: 1.5 * fem,
//               //                     height: 1.5 * fem,
//               //                     child: SvgPicture.asset(
//               //                       'assets/vectors/clock_x2.svg',
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 Container(
//               //                   margin: EdgeInsets.fromLTRB(
//               //                       0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//               //                   child: Text(
//               //                     'MM09130520',
//               //                     style: GoogleFonts.getFont(
//               //                       'Roboto Condensed',
//               //                       fontWeight: FontWeight.w500,
//               //                       fontSize: 0.9 * fem,
//               //                       height: 0.1 * fem,
//               //                       color: Color(0xFF151B33),
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ],
//               //             ),
//               //             Container(
//               //               margin: EdgeInsets.fromLTRB(
//               //                   0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//               //               width: 0.7 * fem,
//               //               height: 0.7 * fem,
//               //               child: SizedBox(
//               //                 width: 0.7 * fem,
//               //                 height: 0.7 * fem,
//               //                 child: SvgPicture.asset(
//               //                   'assets/vectors/group_338241_x2.svg',
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //       Container(
//               //         margin: EdgeInsets.fromLTRB(
//               //             0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
//               //         child: Container(
//               //           decoration: BoxDecoration(
//               //             color: Color(0xFFF3F3F3),
//               //           ),
//               //           child: Container(
//               //             width: 20.4 * fem,
//               //             height: 0.1 * fem,
//               //           ),
//               //         ),
//               //       ),
//               //       Container(
//               //         margin: EdgeInsets.fromLTRB(
//               //             0 * fem, 0 * fem, 0.2 * fem, 0 * fem),
//               //         child: Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Row(
//               //               mainAxisAlignment: MainAxisAlignment.start,
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 Container(
//               //                   margin: EdgeInsets.fromLTRB(
//               //                       0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//               //                   width: 1.5 * fem,
//               //                   height: 1.5 * fem,
//               //                   child: SizedBox(
//               //                     width: 1.5 * fem,
//               //                     height: 1.5 * fem,
//               //                     child: SvgPicture.asset(
//               //                       'assets/vectors/clock_2_x2.svg',
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 Container(
//               //                   margin: EdgeInsets.fromLTRB(
//               //                       0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//               //                   child: Text(
//               //                     '84563217954',
//               //                     style: GoogleFonts.getFont(
//               //                       'Roboto Condensed',
//               //                       fontWeight: FontWeight.w500,
//               //                       fontSize: 0.9 * fem,
//               //                       height: 0.1 * fem,
//               //                       color: Color(0xFF151B33),
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ],
//               //             ),
//               //             Container(
//               //               margin: EdgeInsets.fromLTRB(
//               //                   0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//               //               width: 0.7 * fem,
//               //               height: 0.7 * fem,
//               //               child: SizedBox(
//               //                 width: 0.7 * fem,
//               //                 height: 0.7 * fem,
//               //                 child: SvgPicture.asset(
//               //                   'assets/vectors/group_338242_x2.svg',
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   margin:
//               //       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.6 * fem, 0 * fem),
//               //   width: 8.4 * fem,
//               //   height: 0.3 * fem,
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: Color(0xFF000000),
//               //       borderRadius: BorderRadius.circular(6.3 * fem),
//               //     ),
//               //     child: Container(
//               //       width: 8.4 * fem,
//               //       height: 0.3 * fem,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
















// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class TrackResult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393; // Set your base width for calculations
//     double screenWidth = MediaQuery.of(context).size.width;
//     double ffem = screenWidth / baseWidth;
//     double fem = ffem * 15;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: Container(
//         padding: EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.6 * fem),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //From here add to SliverAppBar
//             // Header
//             Container(
//               margin: EdgeInsets.fromLTRB(0 * fem, 4.0 * fem, 0 * fem, 1.9 * fem),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 2.5 * fem,
//                     height: 2.5 * fem,
//                     padding: EdgeInsets.all(0.5 * fem),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xFFF3F3F3)),
//                       borderRadius: BorderRadius.circular(2.0 * fem),
//                     ),
//                     child: SvgPicture.asset(
//                       'assets/vectors/arrow_left_12_x2.svg',
//                       width: 2.0 * fem,
//                       height: 2.0 * fem,
//                     ),
//                   ),
//                   SizedBox(width: 0.9 * fem),
//                   Text(
//                     'Parcel Tracking',
//                     style: GoogleFonts.getFont(
//                       'Roboto Condensed',
//                       fontWeight: FontWeight.w800,
//                       fontSize: 1 * fem,
//                       color: const Color(0xFF191D31),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Search TextField
//             Container(
//               padding: EdgeInsets.fromLTRB(0.4 * fem, 0 * fem, 1.2 * fem, 0.6 * fem),
//               child: TextField(
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(0.9 * fem),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(0.8 * fem),
//                     borderSide: const BorderSide(color: Color(0xFF1D272F)),
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFF9F9F9),
//                   prefixIcon: Padding(
//                     padding: EdgeInsets.all(0.9 * fem),
//                     child: SvgPicture.asset(
//                       'assets/vectors/search_normal_3_x2.svg',
//                       width: 1.5 * fem,
//                       height: 1.5 * fem,
//                     ),
//                   ),
//                   suffixIcon: Padding(
//                     padding: EdgeInsets.all(0.9 * fem),
//                     child: SvgPicture.asset(
//                       'assets/vectors/scan_10_x2.svg',
//                       width: 1.5 * fem,
//                       height: 1.5 * fem,
//                     ),
//                   ),
//                   hintText: '152634',
//                   hintStyle: GoogleFonts.getFont(
//                     'Roboto Condensed',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 0.9 * fem,
//                     color: const Color(0xFF191D31),
//                   ),
//                 ),
//                 style: GoogleFonts.getFont(
//                   'Roboto Condensed',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 0.9 * fem,
//                   color: const Color(0xFF191D31),
//                 ),
//               ),
//             ),
//
//             //From here add to SliverList
//             // Tracking History and Delete All
//             Container(
//               margin: EdgeInsets.fromLTRB(0.2 * fem, 0 * fem, 1.2 * fem, 1.3 * fem),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Tracking History',
//                     style: GoogleFonts.getFont(
//                       'Roboto Condensed',
//                       fontWeight: FontWeight.w800,
//                       fontSize: 1 * fem,
//                       color: const Color(0xFF191D31),
//                     ),
//                   ),
//                   Text(
//                     'Delete All',
//                     style: GoogleFonts.getFont(
//                       'Roboto Condensed',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 0.9 * fem,
//                       color: const Color(0xFFFD683D),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // List of Tracking History Items
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.fromLTRB(0.3 * fem, 0 * fem, 1.4 * fem, 31.4 * fem),
//                 itemCount: 12, // Original 2 entries + 10 more
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//                                   width: 1.5 * fem,
//                                   height: 1.5 * fem,
//                                   child: SvgPicture.asset(
//                                     'assets/vectors/clock_x2.svg',
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//                                   child: Text(
//                                     'MM09130520', // Placeholder, replace as needed
//                                     style: GoogleFonts.getFont(
//                                       'Roboto Condensed',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 0.9 * fem,
//                                       color: const Color(0xFF151B33),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//                               width: 0.7 * fem,
//                               height: 0.7 * fem,
//                               child: SvgPicture.asset(
//                                 'assets/vectors/group_338241_x2.svg',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFF3F3F3),
//                           ),
//                           child: SizedBox(
//                             width: 20.4 * fem,
//                             height: 0.1 * fem,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class TrackResult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393; // Set your base width for calculations
//     double screenWidth = MediaQuery.of(context).size.width;
//     double ffem = screenWidth / baseWidth;
//     double fem = ffem * 15;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: CustomScrollView(
//         slivers: [
//           // SliverAppBar
//           SliverAppBar(
//             backgroundColor: Colors.white,
//             pinned: true,
//             floating: true,
//             expandedHeight: 30 * fem,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text('Parcel Tracking'),
//               background: SizedBox(
//                 height: 30 * fem, // Constrained height
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.6 * fem),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.fromLTRB(0.4 * fem, 0 * fem, 1.2 * fem, 0.6 * fem),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.9 * fem),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(0.8 * fem),
//                               borderSide: const BorderSide(color: Color(0xFF1D272F)),
//                             ),
//                             filled: true,
//                             fillColor: const Color(0xFFF9F9F9),
//                             prefixIcon: Padding(
//                               padding: EdgeInsets.all(0.9 * fem),
//                               child: SvgPicture.asset(
//                                 'assets/vectors/search_normal_3_x2.svg',
//                                 width: 1.5 * fem,
//                                 height: 1.5 * fem,
//                               ),
//                             ),
//                             suffixIcon: Padding(
//                               padding: EdgeInsets.all(0.9 * fem),
//                               child: SvgPicture.asset(
//                                 'assets/vectors/scan_10_x2.svg',
//                                 width: 1.5 * fem,
//                                 height: 1.5 * fem,
//                               ),
//                             ),
//                             hintText: '152634',
//                             hintStyle: GoogleFonts.getFont(
//                               'Roboto Condensed',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 0.9 * fem,
//                               color: const Color(0xFF191D31),
//                             ),
//                           ),
//                           style: GoogleFonts.getFont(
//                             'Roboto Condensed',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 0.9 * fem,
//                             color: const Color(0xFF191D31),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // SliverList
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     // Tracking History and Delete All
//                     if (index == 0)
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0.2 * fem, 0 * fem, 1.2 * fem, 1.3 * fem),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Tracking History',
//                               style: GoogleFonts.getFont(
//                                 'Roboto Condensed',
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 1 * fem,
//                                 color: const Color(0xFF191D31),
//                               ),
//                             ),
//                             Text(
//                               'Delete All',
//                               style: GoogleFonts.getFont(
//                                 'Roboto Condensed',
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 0.9 * fem,
//                                 color: const Color(0xFFFD683D),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     // List of Tracking History Items
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
//                                 width: 1.5 * fem,
//                                 height: 1.5 * fem,
//                                 child: SvgPicture.asset(
//                                   'assets/vectors/clock_x2.svg',
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
//                                 child: Text(
//                                   'MM09130520', // Placeholder, replace as needed
//                                   style: GoogleFonts.getFont(
//                                     'Roboto Condensed',
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 0.9 * fem,
//                                     color: const Color(0xFF151B33),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
//                             width: 0.7 * fem,
//                             height: 0.7 * fem,
//                             child: SvgPicture.asset(
//                               'assets/vectors/group_338241_x2.svg',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFF3F3F3),
//                         ),
//                         child: SizedBox(
//                           width: 20.4 * fem,
//                           height: 0.1 * fem,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//               childCount: 20, // Original 2 entries + 10 more
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
















import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class TrackResult extends StatefulWidget {
  const TrackResult({super.key});

  @override
  State<TrackResult> createState() => _TrackResultState();
}

class _TrackResultState extends State<TrackResult> {
  Color appBarColor = AppColors.secondaryColor;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393; // Set your base width for calculations
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth * 15;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final offset = scrollNotification.metrics.pixels;
            if (offset > (10 * fem) - kToolbarHeight) {
              setState(() {
                appBarColor = AppColors.primaryColor; // Change to your desired color when fully scrolled up
              });
            } else {
              setState(() {
                appBarColor = AppColors.secondaryColor; // Change back to transparent or any color
              });
            }
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            // SliverAppBar
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              floating: true,
              expandedHeight: 10 * fem,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Calculate the height of the SliverAppBar
                  double appBarHeight = constraints.biggest.height;

                  // Determine whether the title should be shown
                  bool showTitle = appBarHeight <= 9 * fem;

                  return FlexibleSpaceBar(
                    title: showTitle
                        ? Container(
                      padding: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 2 * fem, 0 * fem),
                          child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                          const Text('Parcel Tracking'),
                          SvgPicture.asset(
                            'assets/vectors/scan_10_x2.svg',
                            width: 1.5 * fem,
                            height: 1.5 * fem,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                                                ],
                                              ),
                        )

                        : null, // Hide title when height is more than 20*fem
                    background: SizedBox(
                      height: 10 * fem, // Constrained height
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 0.9 * fem, 0.6 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Header
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 3.3 * fem, 0 * fem, 1.9 * fem),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 0.9 * fem),
                                  Text(
                                    'Parcel Tracking',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 1 * fem,
                                      color: const Color(0xFF191D31),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(0.4 * fem, 0 * fem, 1.2 * fem, 0.6 * fem),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.9 * fem),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.8 * fem),
                                    borderSide: const BorderSide(color: Color(0xFF1D272F)),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.scaffoldBackgroundColor,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.9 * fem),
                                    child: SvgPicture.asset(
                                      'assets/vectors/search_normal_3_x2.svg',
                                      width: 1.5 * fem,
                                      height: 1.5 * fem,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.9 * fem),
                                    child: SvgPicture.asset(
                                      'assets/vectors/scan_10_x2.svg',
                                      width: 1.5 * fem,
                                      height: 1.5 * fem,
                                    ),
                                  ),
                                  hintText: '152634',
                                  hintStyle: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 0.9 * fem,
                                    color: const Color(0xFF191D31),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.9 * fem,
                                  color: const Color(0xFF191D31),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SliverList
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(2 * fem, 1 * fem, 2 * fem, 0.6 * fem),
                    child: Column(
                      children: [
                        // Tracking History and Delete All
                        if (index == 0)
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1.5 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tracking History',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    color: const Color(0xFF191D31),
                                  ),
                                ),
                                Text(
                                  'Delete All',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 0.9 * fem,
                                    color: const Color(0xFFFD683D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        // List of Tracking History Items
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
                                    width: 1.5 * fem,
                                    height: 1.5 * fem,
                                    child: SvgPicture.asset(
                                      'assets/vectors/clock_x2.svg',
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
                                    child: Text(
                                      'MM09130520', // Placeholder, replace as needed
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 0.9 * fem,
                                        color: const Color(0xFF151B33),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
                                width: 0.7 * fem,
                                height: 0.7 * fem,
                                child: SvgPicture.asset(
                                  'assets/vectors/group_338241_x2.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF3F3F3),
                            ),
                            child: SizedBox(
                              width: 20.4 * fem,
                              height: 0.1 * fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 20, // Original 2 entries + 18 more
              ),
            ),
          ],
        ),
      ),
    );
  }
}
