// import 'package:flutter/material.dart';
// import '../../models/parcel.dart';
// import 'bottomdetaillist.dart';
// import 'mapLocaction.dart';
//
// class ParcelTrackingDetailScreen extends StatefulWidget {
//   final Parcel parcel;
//   const ParcelTrackingDetailScreen({super.key, required this.parcel});
//
//   @override
//   State<ParcelTrackingDetailScreen> createState() => _ParcelTrackingDetailScreenState();
// }
//
// class _ParcelTrackingDetailScreenState extends State<ParcelTrackingDetailScreen> {
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
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 30 * fem,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text('Parcel Tracking'),
//               background: SizedBox(
//                 height: 30 * fem, // Constrained height
//                 child: LocationDetails(
//                     movements: widget.parcel.movements, // Pass the movements from the parcel
//                     parcel: widget.parcel
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFFFFFF),
//                   ),
//                   padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFFFFFFF),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Details(parcel: widget.parcel), // Pass the Parcel object here
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../../models/parcel.dart';
import '../../utils/constants.dart';
import 'bottomdetaillist.dart';
import 'mapLocaction.dart';

class ParcelTrackingDetailScreen extends StatefulWidget {
  final Parcel parcel;
  const ParcelTrackingDetailScreen({super.key, required this.parcel});

  @override
  State<ParcelTrackingDetailScreen> createState() => _ParcelTrackingDetailScreenState();
}

class _ParcelTrackingDetailScreenState extends State<ParcelTrackingDetailScreen> {
  Color appBarColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393; // Set your base width for calculations
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final offset = scrollNotification.metrics.pixels;
            if (offset > (30 * fem) - kToolbarHeight) {
              setState(() {
                appBarColor = AppColors.primaryColor; // Change to your desired color when fully scrolled up
              });
            } else {
              setState(() {
                appBarColor = Colors.transparent; // Change back to transparent or any color
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
              backgroundColor: appBarColor, // Dynamic color change
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Parcel Tracking'),
                background: SizedBox(
                  height: 30 * fem, // Constrained height
                  child: LocationDetails(
                    movements: widget.parcel.movements, // Pass the movements from the parcel
                    parcel: widget.parcel,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
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
                                Details(parcel: widget.parcel), // Pass the Parcel object here
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
