import 'package:courier_frontend/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../../utils/utils.dart';

class BarcodeExpansionPanel extends StatelessWidget {
  const BarcodeExpansionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: const Text('Show Parcel Barcode'),
        backgroundColor: Colors.transparent,
        iconColor: AppColors.secondaryColor,
        collapsedIconColor: AppColors.primaryColor,
        children: <Widget>[
          ListTile(
            title: BarcodeWidget(
              barcode: Barcode.code128(),
              data: '456782347623865',
              width: double.infinity,
              height: 5 * fem,
            ),
          ),
        ],
      ),
    );
  }
}
