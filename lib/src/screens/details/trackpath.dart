import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/parcel.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';

class TrackPath extends StatelessWidget {
  final Parcel parcel;

  const TrackPath({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: parcel.movements.length,
            itemBuilder: (context, index) {
              final movement = parcel.movements[index];
              final destinationbranch = parcel.destinationbranch;
              // final status = parcel.status;
              String status;

              if (index == 0) {
                status = 'Pending';
              } else if (index == parcel.movements.length - 1 &&
                  destinationbranch == movement.branch) {
                status = 'Delivered';
              } else {
                status = 'In transit';
              }
              return MovementWidget(
                  movement: movement,
                  destinationbranch: destinationbranch,
                  status: status);
            },
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  3 * fem, 4 * fem, 3 * fem, 2 * fem),
              child: OutlinedButton(
                onPressed: () {
                  // Define the action when the button is pressed
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  side: BorderSide(color: AppColors.textColor.withOpacity(0.5), width: 1),
                ),
                child: const Text(
                  'Report an Issue',
                  style: TextStyle(color: AppColors.textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovementWidget extends StatelessWidget {
  final Movement movement;
  final String destinationbranch;
  final String status;

  const MovementWidget(
      {super.key,
      required this.movement,
      required this.destinationbranch,
      required this.status});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;
    String locationnote = '';

    if (status == 'Pending') {
      locationnote = 'Collected at ';
    } else if (status == 'In transit') {
      locationnote = 'Arrived at ';
    } else {
      locationnote = 'Delivered to ';
    }

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
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0.9 * fem, 0.9 * fem, 0 * fem),
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
                    '$locationnote ${movement.branch}\nTimestamp: ${movement.timestamp.toString().substring(0, 10)}, Status: $status',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.9 * fem,
                      height: 0.1 * fem,
                      color: const Color(0xFF191D31),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        movement.branch == destinationbranch
            ? const SizedBox()
            : Container(
                margin:
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 0 * fem),
                decoration: const BoxDecoration(
                  color: Color(0xFFA7A9B7),
                ),
                child: SizedBox(
                  width: 0.1 * fem,
                  height: 1.3 * fem,
                ),
              ),
      ],
    );
  }
}
