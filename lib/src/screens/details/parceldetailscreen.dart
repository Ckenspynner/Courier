import 'package:flutter/material.dart';
import '../../models/parcel.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'bottomdetaillist.dart';
import 'mapLocaction.dart';

class ParcelTrackingDetailScreen extends StatefulWidget {
  final Parcel parcel;

  const ParcelTrackingDetailScreen({super.key, required this.parcel});

  @override
  State<ParcelTrackingDetailScreen> createState() =>
      _ParcelTrackingDetailScreenState();
}

class _ParcelTrackingDetailScreenState
    extends State<ParcelTrackingDetailScreen> {
  Color appBarColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final offset = scrollNotification.metrics.pixels;
            if (offset > (30 * fem) - kToolbarHeight) {
              setState(() {
                appBarColor = AppColors
                    .primaryColor; // Change to your desired color when fully scrolled up
              });
            } else {
              setState(() {
                appBarColor = Colors
                    .transparent; // Change back to transparent or any color
              });
            }
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 30 * fem,
              backgroundColor: appBarColor,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Calculate the height of the SliverAppBar
                  double appBarHeight = constraints.biggest.height;

                  // Determine whether the title should be shown
                  bool showTitle = appBarHeight <= 9 * fem;

                  return FlexibleSpaceBar(
                    title: showTitle
                        ? Container(
                            padding: EdgeInsets.fromLTRB(
                                2 * fem, 0 * fem, 2 * fem, 0 * fem),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Location Details'),
                              ],
                            ),
                          )
                        : null, // Hide title when height is more than 20*fem
                    background: SizedBox(
                      height: 30 * fem, // Constrained height
                      child: LocationDetails(
                        movements: widget.parcel.movements,
                        // Pass the movements from the parcel
                        parcel: widget.parcel,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Details(parcel: widget.parcel),
                                // Pass the Parcel object here
                              ],
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
    );
  }
}
