import 'package:flutter/material.dart';
import '../../models/parcel.dart';
import 'bottomdetaillist.dart';
import 'mapLocaction.dart';

class ParcelTrackingDetailScreen extends StatefulWidget {
  final Parcel parcel;
  const ParcelTrackingDetailScreen({super.key, required this.parcel});

  @override
  State<ParcelTrackingDetailScreen> createState() => _ParcelTrackingDetailScreenState();
}

class _ParcelTrackingDetailScreenState extends State<ParcelTrackingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393; // Set your base width for calculations
    double screenWidth = MediaQuery.of(context).size.width;
    double ffem = screenWidth / baseWidth;
    double fem = ffem * 15;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Parcel Tracking Detail'),
              background: Container(
                height: 150.0, // Constrained height
                child: LocationDetails(), // Replacing Image.asset with LocationDetails
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
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parcel Details',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
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
    );
  }
}
