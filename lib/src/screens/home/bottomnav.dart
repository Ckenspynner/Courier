import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;

    return Material( // Wrap with Material for elevation and shadow
      elevation: 30,
      color: Colors.transparent, // Set transparent color
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(1.5 * fem)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          color: const Color(0xFFFCFCFC), // Set background color to white
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem('assets/vectors/vector_10_x2.svg', 'Home', 0,ffem),
              _buildNavItem('assets/vectors/vector_181_x2.svg', 'Shipment', 1,ffem),
              //SizedBox(width: 1.5 * fem), // Space for FAB
              _buildNavItem('assets/vectors/vector_87_x2.svg', 'Chat', 2,ffem),
              _buildNavItem('assets/vectors/vector_79_x2.svg', 'Settings', 3,ffem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String asset, String label, int index,double ffem) {
    double baseWidth = 393;
    //double ffem = MediaQuery.of(context).size.width / baseWidth;
    double fem = ffem * 15;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            asset,
            color: selectedIndex == index
                ? Color(0xFFFD683D)
                : Color(0xFF000000).withOpacity(0.4),
            width: 0.9 * fem,
            height: 0.9 * fem,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.getFont(
              'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 0.7 * fem,
              color: selectedIndex == index
                  ? Color(0xFFFD683D)
                  : Color(0xFF000000).withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}




// return Column(
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4.3 * fem),
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// border: Border(
// bottom: BorderSide(
// color: Color(0x33FFFFFF),
// width: 0.3 * fem,
// ),
// ),
// ),
// child: Container(
// padding:
// EdgeInsets.fromLTRB(1.5 * fem, 4 * fem, 0.9 * fem, 8.9 * fem),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin:
// EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.7 * fem, 0 * fem),
// child: const Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [],
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(1.5 * fem, 0 * fem, 1.5 * fem, 1 * fem),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin:
// EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.5 * fem, 0 * fem),
// child: SizedBox(
// width: 18.2 * fem,
// child: Text(
// 'Current Shipment',
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight: FontWeight.w500,
// fontSize: 0.9 * fem,
// color: Color(0xFF353535),
// ),
// ),
// ),
// ),
// Container(
// margin:
// EdgeInsets.fromLTRB(0 * fem, 0.1 * fem, 0 * fem, 0.1 * fem),
// child: Text(
// 'View All',
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight: FontWeight.w500,
// fontSize: 0.8 * fem,
// color: Color(0xFFFD683D),
// ),
// ),
// ),
// ],
// ),
// ),
//
// FutureBuilder<List<Parcel>>(
// future: futureParcels,
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(child: CircularProgressIndicator());
// } else if (snapshot.hasError) {
// return Center(child: Text('Error: ${snapshot.error}'));
// } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// return const Center(child: Text('No parcels found'));
// } else {
// return SizedBox(
// height: 11.5 * fem, // Adjust height as needed
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: snapshot.data!.length,
// itemBuilder: (context, index) {
// Parcel parcel = snapshot.data![index];
// return parcel.status == 'In Transit'
// ? GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => ParcelDetailScreen(parcel: parcel),
// ),
// );
// },
// child: Container(
// width: 26 * fem, // Adjust width as needed
// child: ListTile(
// title: Container(
// margin: EdgeInsets.fromLTRB(
// 0.6 * fem, 0 * fem, 0 * fem, 1.3 * fem),
// decoration: BoxDecoration(
// border:
// Border.all(color: Color(0x99EDEDED)),
// borderRadius:
// BorderRadius.circular(0.5 * fem),
// color: Color(0xFFFFFFFF),
// ),
// child: Container(
// padding: EdgeInsets.fromLTRB(
// 1 * fem, 0.9 * fem, 1 * fem, 1.4 * fem),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem,
// 0 * fem, 0.4 * fem, 1.1 * fem),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0 * fem,
// 0.8 * fem,
// 0 * fem),
// width: 2.5 * fem,
// height: 2.5 * fem,
// padding:
// EdgeInsets.fromLTRB(
// 0.7 * fem,
// 0.6 * fem,
// 0.7 * fem,
// 0.6 * fem),
// child: Container(
// width: 1.1 * fem,
// height: 1.2 * fem,
// child: SizedBox(
// width: 1.1 * fem,
// height: 1.2 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/group_9_x2.svg',
// ),
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0.4 * fem,
// 0 * fem,
// 0.3 * fem),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .center,
// children: [
// Container(
// margin: EdgeInsets
//     .fromLTRB(
// 0 * fem,
// 0 * fem,
// 0 * fem,
// 0.1 * fem),
// child: Text(
// '#${parcel.parcelNumber}#',
// style: GoogleFonts
//     .getFont(
// 'Inter',
// fontWeight:
// FontWeight
//     .w500,
// fontSize:
// 0.8 * fem,
// color: const Color(
// 0xFF353535),
// ),
// ),
// ),
// Container(
// margin: EdgeInsets
//     .fromLTRB(
// 0 * fem,
// 0 * fem,
// 0.6 * fem,
// 0 * fem),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Container(
// margin: EdgeInsets
//     .fromLTRB(
// 0 * fem,
// 0 * fem,
// 0.3 *
// fem,
// 0 * fem),
// child: Text(
// parcel.status,
// style: GoogleFonts
//     .getFont(
// 'Inter',
// fontWeight:
// FontWeight
//     .w400,
// fontSize:
// 0.6 *
// fem,
// color: Color(
// 0xFFABABAB),
// ),
// ),
// ),
// Container(
// margin: EdgeInsets
//     .fromLTRB(
// 0 * fem,
// 0.4 *
// fem,
// 0.3 *
// fem,
// 0.3 *
// fem),
// child:
// Container(
// decoration:
// BoxDecoration(
// color: Color(
// 0xFFABABAB),
// borderRadius:
// BorderRadius.circular(0.1 *
// fem),
// ),
// child:
// Container(
// width: 0.1 *
// fem,
// height:
// 0.1 *
// fem,
// ),
// ),
// ),
// Text(
// parcel.updated_at
//     .substring(0, 10),
// style:
// GoogleFonts
//     .getFont(
// 'Inter',
// fontWeight:
// FontWeight
//     .w400,
// fontSize:
// 0.6 * fem,
// color: Color(
// 0xFFABABAB),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 1 * fem,
// 0 * fem,
// 1 * fem),
// width: 0.4 * fem,
// height: 0.6 * fem,
// child: SizedBox(
// width: 0.4 * fem,
// height: 0.6 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/vector_83_x2.svg',
// ),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0.3 * fem,
// 0 * fem, 0.2 * fem, 0.7 * fem),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// borderRadius:
// BorderRadius.circular(
// 0.4 * fem),
// ),
// child: Container(
// width: 0.8 * fem,
// height: 0.8 * fem,
// padding: EdgeInsets.fromLTRB(
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem),
// // child: SizedBox(
// //   width: 0.4 * fem,
// //   height: 0.3 * fem,
// //   child: SvgPicture.asset(
// //     'assets/vectors/vector_15_x2.svg',
// //   ),
// // ),
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0.4 * fem,
// 0 * fem,
// 0.3 * fem),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// ),
// child: Container(
// height: 0.1 * fem,
// ),
// ),
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// borderRadius:
// BorderRadius.circular(
// 0.4 * fem),
// ),
// child: Container(
// width: 0.8 * fem,
// height: 0.8 * fem,
// padding: EdgeInsets.fromLTRB(
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem),
// child: SizedBox(
// width: 0.4 * fem,
// height: 0.3 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/vector_160_x2.svg',
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0.4 * fem,
// 0 * fem,
// 0.3 * fem),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// ),
// child: Container(
// height: 0.1 * fem,
// ),
// ),
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// borderRadius:
// BorderRadius.circular(
// 0.4 * fem),
// ),
// child: Container(
// width: 0.8 * fem,
// height: 0.8 * fem,
// padding: EdgeInsets.fromLTRB(
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem,
// 0.2 * fem),
// child: SizedBox(
// width: 0.4 * fem,
// height: 0.3 * fem,
// child: SvgPicture.asset(
// 'assets/vectors/vector_88_x2.svg',
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0.4 * fem,
// 0 * fem,
// 0.3 * fem),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFFD683D),
// ),
// child: Container(
// height: 0.1 * fem,
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: 0.8 * fem,
// child: Container(
// width: 0.8 * fem,
// height: 0.8 * fem,
// ),
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0.4 * fem,
// 0 * fem,
// 0.3 * fem),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFFEDEDED),
// ),
// child: Container(
// height: 0.1 * fem,
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: 0.8 * fem,
// child: Container(
// width: 0.8 * fem,
// height: 0.8 * fem,
// ),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(0 * fem,
// 0 * fem, 0 * fem, 0.3 * fem),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0 * fem,
// 0.4 * fem,
// 0 * fem),
// child: SizedBox(
// width: 18.4 * fem,
// child: Text(
// 'From',
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight:
// FontWeight.w400,
// fontSize: 0.6 * fem,
// color: Color(0xFFFD683D),
// ),
// ),
// ),
// ),
// Text(
// 'To',
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight: FontWeight.w400,
// fontSize: 0.6 * fem,
// color: Color(0xFFFD683D),
// ),
// ),
// ],
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.fromLTRB(
// 0 * fem,
// 0 * fem,
// 0.4 * fem,
// 0 * fem),
// child: SizedBox(
// width: 15.1 * fem,
// child: Text(
// parcel.parcelLastLocation,
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight: FontWeight.w500,
// fontSize: 0.6 * fem,
// color: Color(0xFF353535),
// ),
// ),
// ),
// ),
// Text(
// 'California, US',
// style: GoogleFonts.getFont(
// 'Inter',
// fontWeight: FontWeight.w500,
// fontSize: 0.6 * fem,
// color: Color(0xFF353535),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// // Add other parcel information to display in the list
// ),
// )
//     : const SizedBox();
// },
// ),
// );
// }
// },
// ),
// ],
// );