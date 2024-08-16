import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

const Color myColor = Color(0xFFFD683D);

class ParcelPathWidget extends StatelessWidget {
  final double height;
  final Color color;
  final int pointInterval;
  final String status;

  const ParcelPathWidget({
    Key? key,
    this.height = 1,
    this.color = myColor,
    this.pointInterval = 4,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        MySeparator(
          height: height,
          color: color,
          pointInterval: pointInterval,
          status: status, // Pass the status to MySeparator
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            bool showTick = false;
            if (status == "Pending" && index <= 1) {
              showTick = true;
            } else if (status == "In Transit" && index <= 2) {
              showTick = true;
            } else if (status == "Delivered" && index <= 3) {
              showTick = true;
            } else if (index < 1) {
              showTick = true;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: fem),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 0.8 * fem,
                      height: 0.8 * fem,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFD683D),
                      ),
                    ),
                    if (showTick) // Conditionally show the tick
                      Icon(
                        Icons.check,
                        size: 0.4 * fem,
                        color: Colors.white,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _getLabel(index),
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 0.5 * fem,
                    color: const Color(0xFFABABAB),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Collected";
      case 1:
        return "Pending";
      case 2:
        return "In Transit";
      case 3:
        return "Delivered";
      default:
        return "";
    }
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({
    Key? key,
    this.height = 1,
    this.color = myColor,
    this.pointInterval = 4,
    required this.status,
  }) : super(key: key);

  final double height;
  final Color color;
  final int pointInterval;
  final String status;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        // Determine the number of joined points based on the status
        int joinedPoints;
        switch (status) {
          case "Pending":
            joinedPoints = 1;
            break;
          case "In Transit":
            joinedPoints = 2;
            break;
          case "Delivered":
            joinedPoints = 3;
            break;
          default:
            joinedPoints = -1;
        }

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
              }),
            ),
            if (joinedPoints >=
                0) // Only render joining lines if joinedPoints is valid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      height: dashHeight,
                      color: index <= joinedPoints ? color : Colors.transparent,
                    ),
                  );
                }),
              ),
          ],
        );
      },
    );
  }
}
