import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/parcel.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../shipment/parceldetailscreen.dart';

class Recentshipment extends StatefulWidget {
  const Recentshipment({Key? key}) : super(key: key);

  @override
  State<Recentshipment> createState() => _RecentshipmentState();
}

class _RecentshipmentState extends State<Recentshipment> {
  late Future<List<Parcel>> futureParcels;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    futureParcels = fetchParcels(); // Initial fetch
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const refreshInterval = Duration(minutes: 5);
    _timer = Timer.periodic(refreshInterval, (Timer timer) {
      // Fetch parcels periodically
      setState(() {
        futureParcels = fetchParcels();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(1.5 * fem, 0.9 * fem, 1.5 * fem, 0 * fem),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.5 * fem, 0 * fem),
                child: SizedBox(
                  width: 18.2 * fem,
                  child: Text(
                    'Recent Shipment',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.9 * fem,
                      color: AppColors.textColor1,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 0 * fem, 0 * fem),
                child: Text(
                  'View All',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 0.8 * fem,
                    color: Color(0xFFFD683D),
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Parcel>>(
          future: futureParcels,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: SizedBox(
                  height: 12.5 * fem,
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox(
                width: 26 * fem,
                child: ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0.6 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor1),
                      borderRadius: BorderRadius.circular(0.5 * fem),
                      color: AppColors.containerColor,
                    ),
                    child: SizedBox(
                      width: 10 * fem,
                      height: 10 * fem,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.8 * fem, 0 * fem),
                                width: 3.5 * fem,
                                height: 3.5 * fem,
                                padding: EdgeInsets.fromLTRB(0.7 * fem, 0.6 * fem, 0.7 * fem, 0.6 * fem),
                                child: SizedBox(
                                  width: 1.1 * fem,
                                  height: 1.2 * fem,
                                  child: SvgPicture.asset('assets/vectors/group_9_x2.svg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.3 * fem),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.1 * fem),
                                      child: Text(
                                        'No parcel record found',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 0.8 * fem,
                                          color: AppColors.textColor1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.6 * fem, 0 * fem),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.3 * fem, 0 * fem),
                                            child: Text(
                                              'Ship with us at fair rates',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 0.6 * fem,
                                                color: AppColors.subtitleColor,
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Parcel parcel = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParcelDetailScreen(parcel: parcel),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.fromLTRB(0.6 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderColor1),
                                borderRadius: BorderRadius.circular(0.5 * fem),
                                color: AppColors.containerColor,
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(1 * fem, 0.9 * fem, 1.4 * fem, 0.9 * fem),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.8 * fem, 0 * fem),
                                          width: 2.5 * fem,
                                          height: 2.5 * fem,
                                          padding: EdgeInsets.fromLTRB(0.7 * fem, 0.6 * fem, 0.7 * fem, 0.6 * fem),
                                          child: Container(
                                            width: 1.1 * fem,
                                            height: 1.2 * fem,
                                            child: SizedBox(
                                              width: 1.1 * fem,
                                              height: 1.2 * fem,
                                              child: SvgPicture.asset(
                                                'assets/vectors/group_12_x2.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0 * fem, 0.3 * fem),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0.1 * fem),
                                                child: Text(
                                                  '#${parcel.parcelNumber}#',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 0.8 * fem,
                                                    color: AppColors.textColor1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.6 * fem, 0 * fem),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.3 * fem, 0 * fem),
                                                      child: Text(
                                                        parcel.status,
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 0.6 * fem,
                                                          color: AppColors.subtitleColor,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0 * fem, 0.4 * fem, 0.3 * fem, 0.3 * fem),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: AppColors.subtitleColor,
                                                          borderRadius: BorderRadius.circular(0.1 * fem),
                                                        ),
                                                        child: Container(
                                                          width: 0.1 * fem,
                                                          height: 0.1 * fem,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      parcel.updatedAt.toString().substring(0, 10),
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 0.6 * fem,
                                                        color: AppColors.subtitleColor,
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
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 1 * fem),
                                      width: 0.4 * fem,
                                      height: 0.6 * fem,
                                      child: SizedBox(
                                        width: 0.4 * fem,
                                        height: 0.6 * fem,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_177_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
