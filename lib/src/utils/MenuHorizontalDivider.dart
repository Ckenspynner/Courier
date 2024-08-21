import 'package:flutter/material.dart';
import 'package:courier_frontend/src/utils/utils.dart';


// This is the type used by the popup menu below.
enum SampleItem { collected, inTransit, delivered, cancelled }

class MenuHorizontalDivider extends PopupMenuEntry<SampleItem> {
  const MenuHorizontalDivider({super.key});

  @override
  final double height = 10.0; // Adjust this value to set the height of the divider

  @override
  bool represents(SampleItem? value) => false;

  @override
  _MenuHorizontalDividerState createState() => _MenuHorizontalDividerState();
}

class _MenuHorizontalDividerState extends State<MenuHorizontalDivider> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF3F3F3),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 0.1 * fem,
      ),
    );
  }
}
