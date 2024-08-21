import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckButtonWidget extends StatelessWidget {
  final double fem;
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const CheckButtonWidget({
    Key? key,
    required this.fem,
    required this.label,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.6 * fem, 0 * fem, 1.2 * fem, 21.7 * fem),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color, // Use the color passed as a parameter
            borderRadius: BorderRadius.circular(1.9 * fem), // Border radius as per the provided value
          ),
          padding: EdgeInsets.fromLTRB(0 * fem, 1.1 * fem, 0 * fem, 1.1 * fem), // Padding as per the provided value
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w800,
                fontSize: 1 * fem, // Font size as per the provided value
                height: 0.05 * fem, // Line height as per the provided value
                color: const Color(0xFFFFFFFF), // Text color remains white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
