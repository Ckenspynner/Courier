import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../rates/checkrates.dart';

class Topnav extends StatelessWidget {
  const Topnav({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5 * fem, vertical: 9.7 * fem),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
          width: 5,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(0.5 * fem),
        color: AppColors.containerColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(0, 0),
            blurRadius: 7.5,
          ),
        ],
      ),
      padding: EdgeInsets.all(1.5 * fem),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/vectors/group_8_x2.svg', width: 1.6 * fem, height: 1.6 * fem),
              SvgPicture.asset('assets/vectors/group_x2.svg', width: 1.6 * fem, height: 1.6 * fem),
              SvgPicture.asset('assets/vectors/group_10_x2.svg', width: 1.6 * fem, height: 1.6 * fem),
              SvgPicture.asset('assets/vectors/group_3_x2.svg', width: 1.6 * fem, height: 1.6 * fem),
            ],
          ),
          SizedBox(height: 0.5 * fem),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CheckRates(),
                      ),
                    );
                  },
                  child: _buildNavText('Check Rate', fem)),
              GestureDetector(
                  onTap: () {
                    // Add your onTap action here for the fourth SVG
                    print('Pick Up');
                  },
                  child: _buildNavText('Pick Up', fem)),
              GestureDetector(
                  onTap: () {
                    // Add your onTap action here for the fourth SVG
                    print('Drop Off');
                  },
                  child: _buildNavText('Drop Off', fem)),
              GestureDetector(
                  onTap: () {
                    // Add your onTap action here for the fourth SVG
                    print('History');
                  },
                  child: _buildNavText('History', fem)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavText(String text, double fem) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 0.8 * fem,
        color: AppColors.textColor,
      ),
    );
  }
}
