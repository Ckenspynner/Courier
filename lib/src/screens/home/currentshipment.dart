import 'dart:async';

import 'package:courier_frontend/src/screens/home/parcelpathwidget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/parcel.dart';
import '../details/parceldetailscreen.dart';
import '../shipment/parceldetailscreen.dart';
import '../trackingevent/TrackResult.dart';

class Currentshipment extends StatefulWidget {
  const Currentshipment({super.key});

  @override
  State<Currentshipment> createState() => _CurrentshipmentState();
}

class _CurrentshipmentState extends State<Currentshipment> {
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
    double baseWidth = 393;
    double ffem = MediaQuery.of(context).size.width / baseWidth;
    double screenwidth = MediaQuery.of(context).size.width;
    double fem = ffem * 15;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(1.5 * fem, 1 * fem, 1.5 * fem, 1 * fem),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.5 * fem, 0 * fem),
                child: SizedBox(
                  width: 18.2 * fem,
                  child: Text(
                    'Current Shipment',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.9 * fem,
                      color: Color(0xFF353535),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TrackResult(),
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 0 * fem, 0.1 * fem),
                  child: Text(
                    'View All',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 0.8 * fem,
                      color: const Color(0xFFFD683D),
                    ),
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
                      child: Text('Error: ${snapshot.error}')));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox(
                width: 26 * fem, // Adjust width as needed
                child: ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(
                        0.6 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: Color(0x99EDEDED)),
                      borderRadius:
                      BorderRadius.circular(0.5 * fem),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: SizedBox(
                      width: 10 * fem, // Set desired width
                      height: 10 * fem, // Set desired height
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
                                          color: const Color(0xFF353535),
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
                                                color: Color(0xFFABABAB),
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
                    )

                  ),
                ),
                // Add other parcel information to display in the list
              );
            } else {
              return SizedBox(
                height: 12.5 * fem, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Parcel parcel = snapshot.data![index];
                    return parcel.status == 'Pending' ||
                            parcel.status == 'In Transit' ||
                            parcel.status == 'Delivered'
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ParcelTrackingDetailScreen(parcel: parcel),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 26 * fem, // Adjust width as needed
                              child: ListTile(
                                title: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0.6 * fem, 0 * fem, 0 * fem, 1.3 * fem),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x99EDEDED)),
                                    borderRadius:
                                        BorderRadius.circular(0.5 * fem),
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        1 * fem, 0.9 * fem, 1 * fem, 1.4 * fem),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0.8 * fem,
                                                      0 * fem),
                                                  width: 2.5 * fem,
                                                  height: 2.5 * fem,
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.7 * fem,
                                                      0.6 * fem,
                                                      0.7 * fem,
                                                      0.6 * fem),
                                                  child: Container(
                                                    width: 1.1 * fem,
                                                    height: 1.2 * fem,
                                                    child: SizedBox(
                                                      width: 1.1 * fem,
                                                      height: 1.2 * fem,
                                                      child: SvgPicture.asset(
                                                        'assets/vectors/group_9_x2.svg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0.4 * fem,
                                                      0 * fem,
                                                      0.3 * fem),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem,
                                                                0.1 * fem),
                                                        child: Text(
                                                          '#${parcel.parcelNumber}#',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 0.8 * fem,
                                                            color: const Color(
                                                                0xFF353535),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                0.6 * fem,
                                                                0 * fem),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0.3 * fem,
                                                                      0 * fem),
                                                              child: Text(
                                                                parcel.status,
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      0.6 * fem,
                                                                  color: Color(
                                                                      0xFFABABAB),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0.4 * fem,
                                                                      0.3 * fem,
                                                                      0.3 *
                                                                          fem),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFABABAB),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(0.1 *
                                                                              fem),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      0.1 * fem,
                                                                  height:
                                                                      0.1 * fem,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              parcel.updatedAt.toString()
                                                                  .substring(
                                                                      0, 10),
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    0.6 * fem,
                                                                color: const Color(
                                                                    0xFFABABAB),
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
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  1 * fem,
                                                  0 * fem,
                                                  1 * fem),
                                              width: 0.4 * fem,
                                              height: 0.6 * fem,
                                              child: SizedBox(
                                                width: 0.4 * fem,
                                                height: 0.6 * fem,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_83_x2.svg',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ParcelPathWidget(
                                          height: 1,
                                          color: const Color(0xFFFD683D),
                                          pointInterval: 4,
                                          status: parcel
                                              .status, // Pass the status here
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0.4 * fem, 0 * fem, 0.3 * fem),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0.4 * fem,
                                                    0 * fem),
                                                child: SizedBox(
                                                  width: 18.4 * fem,
                                                  child: Text(
                                                    'From',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 0.6 * fem,
                                                      color: Color(0xFFFD683D),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'To',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 0.6 * fem,
                                                  color: Color(0xFFFD683D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  0.4 * fem,
                                                  0 * fem),
                                              child: SizedBox(
                                                width: 15.1 * fem,
                                                child: Text(
                                                  parcel.senderLocation,
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 0.6 * fem,
                                                    color: Color(0xFF353535),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              parcel.recipientLocation,
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 0.6 * fem,
                                                color: Color(0xFF353535),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Add other parcel information to display in the list
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
