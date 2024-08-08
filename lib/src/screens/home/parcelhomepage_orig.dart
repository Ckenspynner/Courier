import 'package:courier_frontend/src/utils/http_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../addparcelscreen.dart';

class ParcelHomePage extends StatefulWidget {
  @override
  _ParcelHomePageState createState() => _ParcelHomePageState();
}

class _ParcelHomePageState extends State<ParcelHomePage> {
  List<String> imageUrls = [];
  bool isLoading = true;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchBannerImages();
  }

  Future<void> fetchBannerImages() async {
    try {
      final response = await http.get(Uri.parse(banners));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          imageUrls = data.map((item) => item['image'] as String).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // You can add navigation logic here based on the index
      // For example, if index == 1, navigate to AddParcelScreen
      // If index == 2, navigate to another screen

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel Homepage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User account name and greetings
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Username!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Good morning!',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            // Slide show of banner pictures
            // Container(
            //   height: 200,
            //   child: isLoading
            //       ? Center(child: CircularProgressIndicator())
            //       : CarouselSlider(
            //     options: CarouselOptions(
            //       height: 200.0,
            //       autoPlay: true,
            //       enlargeCenterPage: true,
            //     ),
            //     items: imageUrls.map((url) {
            //       return Builder(
            //         builder: (BuildContext context) {
            //           return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin: EdgeInsets.symmetric(horizontal: 5.0),
            //             decoration: const BoxDecoration(
            //               color: Colors.amber,
            //             ),
            //             child: Image.network(
            //               url,
            //               fit: BoxFit.cover,
            //             ),
            //           );
            //         },
            //       );
            //     }).toList(),
            //   ),
            // ),
            // 4 buttons on a grid
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildButton(context, 'Send Shipment', Icons.flight_takeoff,0),
                  _buildButton(context, 'Batch Sending Parcel', Icons.widgets,1),
                  _buildButton(context, 'Rate & Transit Time', Icons.access_alarm,2),
                  _buildButton(context, 'Customer Support', Icons.account_box,3),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData iconData, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            // Add your button tap logic here
            if (index == 0) {
              // Navigate to AddParcelScreen if the button index is 1
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddParcelScreen()),
              );
            }

          },
          child: Container(
            width: 60,  // Set the desired width
            height: 60, // Set the desired height
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Use theme color
              borderRadius: BorderRadius.circular(30), // Make the button round, half of width/height for full circle
            ),
            child: Icon(
              iconData,
              size: 24, // Reduce icon size
              color: Colors.white, // Icon color
            ),
          ),
        ),
        const SizedBox(height: 4), // Reduced space between the button and the text
        Text(
          text,
          style: TextStyle(
            color: Colors.black, // Text color
            fontSize: 16,
            fontWeight: FontWeight.bold,// Reduced text size
          ),
        ),
      ],
    );
  }
}





// import 'package:courier_frontend/src/screens/home/bannerslideshow.dart';
// import 'package:courier_frontend/src/screens/home/recentshipment.dart';
// import 'package:courier_frontend/src/screens/home/topNav.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'currentshipment.dart';
//
// class ParcelHomePage extends StatefulWidget {
//   @override
//   _ParcelHomePageState createState() => _ParcelHomePageState();
// }
//
// class _ParcelHomePageState extends State<ParcelHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393;
//     double ffem = MediaQuery.of(context).size.width / baseWidth;
//     double screenwidth = MediaQuery.of(context).size.width;
//     double fem = ffem * 15;
//     //double fem = MediaQuery.of(context).size.width / 25;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFFD683D),
//           elevation: 0,
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFFFFF),
//                   borderRadius: BorderRadius.circular(2*fem),
//                 ),
//                 child: Container(
//                   width: 2.5*fem,
//                   height: 2.5*fem,
//                   padding: EdgeInsets.fromLTRB(0.1*fem, 0.1*fem, 0.1*fem, 0.1*fem),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2.1*fem),
//                       //borderRadius: BorderRadius.circular(30),
//                       image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(
//                           'assets/images/ellipse_8.png',
//                         ),
//                       ),
//                     ),
//                     child: Container(
//                       width: 2.3*fem,
//                       height: 2.3*fem,
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.4*fem, 0*fem),
//                         child: Text(
//                           'Noida Sector 75',
//                           style: GoogleFonts.getFont(
//                             'Inter',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 0.8*fem,
//                             color: Color(0xFFFFFFFF),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0*fem, 0.4*fem, 0*fem, 0.4*fem),
//                         child: SizedBox(
//                           width: 0.3*fem,
//                           height: 0.2*fem,
//                           child: SvgPicture.asset(
//                             'assets/vectors/vector_2_x2.svg',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Opacity(
//                     opacity: 0.6,
//                     child: Text(
//                       'Golf city, Plot 8, Sector 75',
//                       style: GoogleFonts.getFont(
//                         'Inter',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 0.6*fem,
//                         color: Color(0xFFFFFFFF),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Stack(
//                 children: [
//                   Positioned(
//                     top: -0.8*fem,
//                     child: Opacity(
//                       opacity: 0.2,
//                       child: Container(
//                         width: 2.5*fem,
//                         height: 2.5*fem,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 2.5*fem,
//                     height: 2.5*fem,
//                     padding: EdgeInsets.fromLTRB(0.8*fem, 0.8*fem, 0.8*fem, 0.8*fem),
//                     child: Container(
//                       width: 0.8*fem,
//                       height: 0.9*fem,
//                       child: SizedBox(
//                         width: 0.8*fem,
//                         height: 0.9*fem,
//                         child: SvgPicture.asset(
//                           'assets/vectors/vector_118_x2.svg',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         //bottomNavigationBar: const BottomNav(),
//         //bottomNavigationBar: const Text('Sangulo'),
//         body: SingleChildScrollView(
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.blue//Color(0xFFFCFCFC),
//             ),
//             child: const Stack(
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Currentshipment(),
//                       Recentshipment(),
//                       //const BottomNav(),
//                     ],
//                   ),
//                 ),
//                 Bannerslideshow(),
//                 Topnav(),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 1, end: 1.2).animate(_controller);
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _controller.forward().then((value) => _controller.reverse());
//   }
//
//   Widget _buildNavItem(String asset, String label, int index) {
//     double baseWidth = 393;
//     double ffem = MediaQuery.of(context).size.width / baseWidth;
//     double screenwidth = MediaQuery.of(context).size.width;
//     double fem = ffem * 15;
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _selectedIndex == index ? _animation.value : 1,
//                 child: SvgPicture.asset(
//                   asset,
//                   color: _selectedIndex == index  ? Color(0xFFFD683D) : Color(0xFF000000).withOpacity(0.4),
//                   width: 0.9 * fem,
//                   height: 0.9 * fem,
//                 ),
//               );
//             },
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: GoogleFonts.getFont(
//               'Inter',
//               fontWeight: FontWeight.w600,
//               fontSize: 0.7 * fem,
//               color: _selectedIndex == index  ? Color(0xFFFD683D) : Color(0xFF000000).withOpacity(0.4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393;
//     double ffem = MediaQuery.of(context).size.width / baseWidth;
//     double screenwidth = MediaQuery.of(context).size.width;
//     double fem = ffem * 15;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Bottom Navigation Bar'),
//       ),
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: const <Widget>[
//           Center(child: Text("Home")),
//           Center(child: Text("Shipment")),
//           Center(child: Text("Chat")),
//           Center(child: Text("Settings")),
//         ],
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(1.5 * fem)),
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 6.0,
//           color: Colors.white, // Set background color to white
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               _buildNavItem('assets/vectors/vector_10_x2.svg', 'Home', 0),
//               _buildNavItem('assets/vectors/vector_181_x2.svg', 'Shipment', 1),
//               //SizedBox(width: 1.5 * fem), // Space for FAB
//               _buildNavItem('assets/vectors/vector_87_x2.svg', 'Chat', 2),
//               _buildNavItem('assets/vectors/vector_79_x2.svg', 'Settings', 3),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         width: 3.3 * fem,
//         height: 3.3 * fem,
//         padding: EdgeInsets.all(0.6 * fem),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment(-2.754, -1.214),
//             end: Alignment(1.431, 1.75),
//             colors: <Color>[Color(0xFFFF965A), Color(0xFFFD683D)],
//             stops: <double>[0, 1],
//           ),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: FloatingActionButton(
//           onPressed: () {},
//           tooltip: 'Increment',
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SvgPicture.asset(
//             'assets/vectors/vector_51_x2.svg',
//             width: 1.1 * fem,
//             height: 1.1 * fem,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }



//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:animations/animations.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 1, end: 1.2).animate(_controller);
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _controller.forward().then((value) => _controller.reverse());
//   }
//
//   Widget _buildNavItem(String asset, String label, int index) {
//     double baseWidth = 393;
//     double ffem = MediaQuery.of(context).size.width / baseWidth;
//     double fem = ffem * 15;
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _selectedIndex == index ? _animation.value : 1,
//                 child: SvgPicture.asset(
//                   asset,
//                   color: _selectedIndex == index ? Color(0xFFFD683D) : Color(0xFF000000).withOpacity(0.4),
//                   width: 0.9 * fem,
//                   height: 0.9 * fem,
//                 ),
//               );
//             },
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: GoogleFonts.getFont(
//               'Inter',
//               fontWeight: FontWeight.w600,
//               fontSize: 0.7 * fem,
//               color: _selectedIndex == index ? Color(0xFFFD683D) : Color(0xFF000000).withOpacity(0.4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393;
//     double ffem = MediaQuery.of(context).size.width / baseWidth;
//     double fem = ffem * 15;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Bottom Navigation Bar'),
//       ),
//       body: PageTransitionSwitcher(
//         duration: const Duration(milliseconds: 300),
//         transitionBuilder: (Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
//           return FadeThroughTransition(
//             animation: primaryAnimation,
//             secondaryAnimation: secondaryAnimation,
//             child: child,
//           );
//         },
//         child: IndexedStack(
//           index: _selectedIndex,
//           children: const <Widget>[
//             Center(child: Text("Home")),
//             Center(child: Text("Shipment")),
//             Center(child: Text("Chat")),
//             Center(child: Text("Settings")),
//           ],
//         ),
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(1.5 * fem)),
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 6.0,
//           color: Colors.white, // Set background color to white
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               _buildNavItem('assets/vectors/vector_10_x2.svg', 'Home', 0),
//               _buildNavItem('assets/vectors/vector_181_x2.svg', 'Shipment', 1),
//               //SizedBox(width: 1.5 * fem), // Space for FAB
//               _buildNavItem('assets/vectors/vector_87_x2.svg', 'Chat', 2),
//               _buildNavItem('assets/vectors/vector_79_x2.svg', 'Settings', 3),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         width: 3.3 * fem,
//         height: 3.3 * fem,
//         padding: EdgeInsets.all(0.6 * fem),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment(-2.754, -1.214),
//             end: Alignment(1.431, 1.75),
//             colors: <Color>[Color(0xFFFF965A), Color(0xFFFD683D)],
//             stops: <double>[0, 1],
//           ),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: FloatingActionButton(
//           onPressed: () {},
//           tooltip: 'Increment',
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SvgPicture.asset(
//             'assets/vectors/vector_51_x2.svg',
//             width: 1.1 * fem,
//             height: 1.1 * fem,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

