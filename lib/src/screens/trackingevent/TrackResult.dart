import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../../utils/MenuHorizontalDivider.dart';
import '../../utils/constants.dart';
import '../../models/parcel.dart';
import '../../utils/http_strings.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;
import '../details/parceldetailscreen.dart';

class TrackResult extends StatefulWidget {
  const TrackResult({super.key});

  @override
  State<TrackResult> createState() => _TrackResultState();
}

class _TrackResultState extends State<TrackResult> {
  Color appBarColor = AppColors.secondaryColor;
  final TextEditingController _textController = TextEditingController();
  List<Parcel> allParcels = []; // Full list of parcels
  List<Parcel> filteredParcels = []; // Filtered list of parcels based on input
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    _fetchParcels(); // Fetch parcels when the widget is initialized
  }

  Future<void> _fetchParcels() async {
    try {
      List<Parcel> parcels = await fetchParcels();
      setState(() {
        allParcels = parcels;
        filteredParcels = parcels; // Initially show all parcels
      });
    } catch (e) {
      // Handle errors here
    }
  }

  void _filterParcels(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredParcels = allParcels; // Show all parcels when query is empty
      } else {
        filteredParcels = allParcels
            .where((parcel) => parcel.parcelNumber.contains(query))
            .toList();
      }
    });
  }

  Future<void> scanBarcode(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color for the cancel button
        'Cancel', // Text for the cancel button
        true, // Show the flash icon
        ScanMode.BARCODE, // Scan mode, can be QR, Barcode, or BOTH
      );

      if (barcodeScanRes != '-1') {
        setState(() {
          _textController.text = barcodeScanRes;
        });

        _filterParcels(barcodeScanRes);

        // If the scan result is not canceled
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Barcode Scanned: $barcodeScanRes')),
        // );
      }
    } catch (e) {
      barcodeScanRes = 'Failed to get the barcode: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(barcodeScanRes)),
      );
    }
  }
  void _showPopupMenu(BuildContext context, Offset offset, int parcelid) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        overlay.size.width - offset.dx,
        overlay.size.height - offset.dy,
      ),
      items: <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.collected,
          child: Text('Ready for Picked Up'),
        ),
        const MenuHorizontalDivider(),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.inTransit,
          child: Text('In Transit'),
        ),
        const MenuHorizontalDivider(),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.delivered,
          child: Text('Delivered'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.cancelled,
          child: Text('Cancelled'),
        ),
      ],
      color: Colors.white,
    ).then((SampleItem? item) {
      if (item != null) {
        _confirmAndExecuteAction(context, item,parcelid);
        setState(() {
          selectedItem = item;
        });
      }
    });
  }

  Future<void> _confirmAndExecuteAction(
      BuildContext context, SampleItem item, int parcelid) async {
    bool confirmed = await _showConfirmationDialog(context, item);

    if (confirmed) {
      await _updateParcelStatus(item,parcelid);
    }
  }

  Future<bool> _showConfirmationDialog(
      BuildContext context, SampleItem item) async {
    String status = _getStatusText(item);

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Action'),
          content:
              Text('Are you sure you want to mark this parcel as "$status"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  String _getStatusText(SampleItem item) {
    switch (item) {
      case SampleItem.collected:
        return 'Ready for Picked Up';
      case SampleItem.inTransit:
        return 'In Transit';
      case SampleItem.delivered:
        return 'Delivered';
      case SampleItem.cancelled:
        return 'Cancelled';
      default:
        return '';
    }
  }

  Future<void> _updateParcelStatus(SampleItem item, int parcelid) async {
    String status = _getStatusText(item);

    final response = await http.patch(
      Uri.parse('$update_Parcel_Status/$parcelid/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: '{"status": "$status"}',
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Parcel status updated to "$status".')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update parcel status.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions =
        ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final offset = scrollNotification.metrics.pixels;
            if (offset > (10 * fem) - kToolbarHeight) {
              setState(() {
                appBarColor = AppColors.primaryColor;
              });
            } else {
              setState(() {
                appBarColor = AppColors.secondaryColor;
              });
            }
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              floating: true,
              expandedHeight: 10 * fem,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double appBarHeight = constraints.biggest.height;
                  bool showTitle = appBarHeight <= 9 * fem;

                  return FlexibleSpaceBar(
                    title: showTitle
                        ? Container(
                            padding: EdgeInsets.fromLTRB(
                                2 * fem, 0 * fem, 2 * fem, 0 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Parcel Tracking'),
                                GestureDetector(
                                  onTap: () => scanBarcode(context),
                                  child: SvgPicture.asset(
                                    'assets/vectors/scan_10_x2.svg',
                                    width: 1.5 * fem,
                                    height: 1.5 * fem,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : null,
                    background: SizedBox(
                      height: 10 * fem,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            1.5 * fem, 0.9 * fem, 0.9 * fem, 0.6 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 3.3 * fem, 0 * fem, 1.9 * fem),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 0.9 * fem),
                                  Text(
                                    'Parcel Tracking',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 1 * fem,
                                      color: const Color(0xFF191D31),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0.4 * fem, 0 * fem, 1.2 * fem, 0.6 * fem),
                              child: TextField(
                                controller: _textController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(15),
                                ],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.9 * fem),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(0.8 * fem),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF1D272F)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(0.8 * fem),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.scaffoldBackgroundColor,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.9 * fem),
                                    child: SvgPicture.asset(
                                      'assets/vectors/search_normal_3_x2.svg',
                                      width: 1.5 * fem,
                                      height: 1.5 * fem,
                                    ),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () => scanBarcode(context),
                                    child: Padding(
                                      padding: EdgeInsets.all(0.9 * fem),
                                      child: SvgPicture.asset(
                                        'assets/vectors/scan_10_x2.svg',
                                        width: 1.5 * fem,
                                        height: 1.5 * fem,
                                      ),
                                    ),
                                  ),
                                  hintText: 'Enter parcel number',
                                  hintStyle: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 0.9 * fem,
                                    color: const Color(0xFF191D31),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.9 * fem,
                                  color: const Color(0xFF191D31),
                                ),
                                onChanged: _filterParcels,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (filteredParcels.isEmpty) {
                    // Show the SVG if no parcels are found
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          2 * fem, 1 * fem, 2 * fem, 0.6 * fem),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        // Ensure the SVG takes up most of the screen height
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/vectors/clock_x2.svg',
                                width: 5 * fem,
                                height: 5 * fem,
                                colorFilter: ColorFilter.mode(
                                  appBarColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(height: 2 * fem),
                              // Spacing between SVG and text
                              Text(
                                'No parcel record found',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 1 * fem,
                                  color: const Color(0xFF191D31),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  if (index >= filteredParcels.length) return null;

                  final parcel = filteredParcels[index];

                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        2 * fem, 1 * fem, 2 * fem, 0.6 * fem),
                    child: Column(
                      children: [
                        if (index == 0)
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 1.5 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tracking History',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 1 * fem,
                                    color: const Color(0xFF191D31),
                                  ),
                                ),
                                Text(
                                  'See All',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 0.9 * fem,
                                    color: const Color(0xFFFD683D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ParcelTrackingDetailScreen(parcel: parcel),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0.2 * fem, 0.9 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0.9 * fem, 0 * fem),
                                      width: 1.5 * fem,
                                      height: 1.5 * fem,
                                      child: SvgPicture.asset(
                                        'assets/vectors/clock_x2.svg',
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0.2 * fem),
                                      child: Text(
                                        parcel.parcelNumber,
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 0.9 * fem,
                                          color: const Color(0xFF151B33),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    _showPopupMenu(
                                        context, details.globalPosition,parcel.id);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0.4 * fem, 0 * fem, 0.4 * fem),
                                    width: 1.5 * fem,
                                    height: 1.5 * fem,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.3 * fem),
                                      child: SvgPicture.asset(
                                        'assets/vectors/group_338241_x2.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 0.8 * fem),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF3F3F3),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 0.1 * fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount:
                    filteredParcels.isEmpty ? 1 : filteredParcels.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
