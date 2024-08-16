import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'appbar.dart';
import 'bannerslideshow.dart';
import 'bottomnav.dart';
import 'currentshipment.dart';
import 'recentshipment.dart';
import 'topNav.dart';

class ParcelHomePage extends StatefulWidget {
  @override
  _ParcelHomePageState createState() => _ParcelHomePageState();
}

class _ParcelHomePageState extends State<ParcelHomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.2).animate(_controller);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward().then((value) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic sizes based on screen dimensions
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double fem = dimensions['fem']!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  title: const Appbar(),
                  pinned: true,
                  expandedHeight: 24.5 * fem,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        // Background container
                        Positioned(
                          top: 0, // No need to multiply by fem here
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: AppDecorations.appBarDecoration,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(1.5 * fem, 4 * fem, 0.9 * fem, 14.9 * fem),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0.7 * fem, 0),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Banner slideshow
                        Positioned(
                          top: 7 * fem, // Adjust this value to push the banner slideshow down
                          left: 0,
                          right: 0,
                          child: Bannerslideshow(),
                        ),
                        // Top navigation bar
                        Positioned(
                          top: 10 * fem, // Adjust this value to push the topnav down
                          left: 0,
                          right: 0,
                          child: Topnav(),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        color: AppColors.scaffoldBackgroundColor, // Your desired background color
                        child: const Column(
                          children: [
                            Currentshipment(),
                            Recentshipment(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(child: Text("Shipment")),
            const Center(child: Text("Chat")),
            const Center(child: Text("Settings")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: Container(
        width: 3.3 * fem,
        height: 3.3 * fem,
        padding: EdgeInsets.all(0.6 * fem),
        decoration: AppDecorations.floatingActionButtonDecoration,
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: SvgPicture.asset(
            'assets/vectors/vector_51_x2.svg',
            width: 1.1 * fem,
            height: 1.1 * fem,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
