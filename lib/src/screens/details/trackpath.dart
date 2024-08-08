import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/parcel.dart';

class TrackPath extends StatelessWidget {
  final Parcel parcel;

  const TrackPath({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: parcel.movements.length,
              itemBuilder: (context, index) {
                final movement = parcel.movements[index];
                return MovementWidget(movement: movement);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovementWidget extends StatelessWidget {
  final Movement movement;

  const MovementWidget({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0.9 * fem, 0 * fem),
                  width: 1.5 * fem,
                  height: 1.5 * fem,
                  child: SizedBox(
                    width: 1.5 * fem,
                    height: 1.5 * fem,
                    child: SvgPicture.asset(
                      'assets/vectors/record_circle_11_x2.svg',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
                  child: Text(
                    'Location: ${movement.branch}\nTimestamp: ${movement.timestamp.toString().substring(0, 10)}',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.9 * fem,
                      height: 0.1 * fem,
                      color: Color(0xFF191D31),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 0 * fem),
          decoration: const BoxDecoration(
            color: Color(0xFFA7A9B7),
          ),
          child: Container(
            width: 0.1 * fem,
            height: 1.3 * fem,
          ),
        ),
      ],
    );
  }
}

// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.3 * fem),
// child: Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SizedBox(
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/record_circle_11_x2.svg',
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
// child: Text(
// '1213 Washington Blvd, Belpre, OH ',
// style: GoogleFonts.getFont(
// 'Roboto Condensed',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// height: 0.1 * fem,
// color: Color(0xFF191D31),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19.1 * fem, 0.4 * fem),
// child: Align(
// alignment: Alignment.topCenter,
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFA7A9B7),
// ),
// child: Container(
// width: 0.1 * fem,
// height: 1.3 * fem,
// ),
// ),
// ),
// ),
//
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.3 * fem),
// child: Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SizedBox(
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/record_circle_11_x2.svg',
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
// child: Text(
// '1213 Washington Blvd, Belpre, OH ',
// style: GoogleFonts.getFont(
// 'Roboto Condensed',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// height: 0.1 * fem,
// color: Color(0xFF191D31),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19.1 * fem, 0.4 * fem),
// child: Align(
// alignment: Alignment.topCenter,
// child: Container(
// decoration: const BoxDecoration(
// color: Color(0xFFA7A9B7),
// ),
// child: Container(
// width: 0.1 * fem,
// height: 1.3 * fem,
// ),
// ),
// ),
// ),
//
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.3 * fem),
// child: Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SizedBox(
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/record_circle_11_x2.svg',
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
// child: Text(
// '1213 Washington Blvd, Belpre, OH ',
// style: GoogleFonts.getFont(
// 'Roboto Condensed',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// height: 0.1 * fem,
// color: Color(0xFF191D31),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19.1 * fem, 0.4 * fem),
// child: Align(
// alignment: Alignment.topCenter,
// child: Container(
// decoration: const BoxDecoration(
// color: Color(0xFFA7A9B7),
// ),
// child: Container(
// width: 0.1 * fem,
// height: 1.3 * fem,
// ),
// ),
// ),
// ),
//
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.3 * fem),
// child: Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SizedBox(
// width: 1.5 * fem,
// height: 1.5 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/record_circle_11_x2.svg',
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0.2 * fem, 0 * fem, 0.2 * fem),
// child: Text(
// '1213 Washington Blvd, Belpre, OH ',
// style: GoogleFonts.getFont(
// 'Roboto Condensed',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// height: 0.1 * fem,
// color: Color(0xFF191D31),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19.1 * fem, 0.4 * fem),
// child: Align(
// alignment: Alignment.topCenter,
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFA7A9B7),
// ),
// child: Container(
// width: 0.1 * fem,
// height: 1.3 * fem,
// ),
// ),
// ),
// ),
//
// Container(
// margin: EdgeInsets.fromLTRB(0.2 * fem, 0 * fem, 0.2 * fem, 0 * fem),
// child: Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1.1 * fem, 0 * fem),
// width: 1.1 * fem,
// height: 1.3 * fem,
// child: SizedBox(
// width: 1.1 * fem,
// height: 1.3 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/vector_133_x2.svg',
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 0 * fem, 0.1 * fem),
// child: Text(
// '121 Pike St, Marietta, OH ',
// style: GoogleFonts.getFont(
// 'Roboto Condensed',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// height: 0.1 * fem,
// color: Color(0xFF191D31),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
