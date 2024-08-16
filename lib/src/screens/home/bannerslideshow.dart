import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/constants.dart';
import '../../utils/http_strings.dart';
import '../../utils/utils.dart';

class Bannerslideshow extends StatefulWidget {
  const Bannerslideshow({Key? key}) : super(key: key);

  @override
  State<Bannerslideshow> createState() => _BannerslideshowState();
}

class _BannerslideshowState extends State<Bannerslideshow> {
  List<String> imageUrls = [];
  bool isLoading = true;

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

  @override
  Widget build(BuildContext context) {
    Map<String, double> dimensions = ScreenSizeUtils.calculateDimensions(context);
    double ffem = dimensions['ffem']!;
    double fem = dimensions['fem']!;
    double screenWidth = dimensions['screenWidth']!;

    return Padding(
      padding: EdgeInsets.fromLTRB(0.8 * fem, 1.5 * fem, 0.8 * fem, 0),
      child: isLoading
          ? Container(
        width: screenWidth - 1.6 * fem,
        height: 14.8 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.1 * fem),
          color: AppColors.placeholderColor,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/screenshot_202406121416141.png',
            ),
          ),
        ),
      )
          : Container(
        width: screenWidth - 1.6 * fem,
        height: 14.8 * fem,
        child: Swiper(
          scrollDirection: Axis.vertical,
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.1 * fem),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrls[index]),
                ),
              ),
            );
          },
          autoplay: true,
          autoplayDelay: 3000,
          // Uncomment the following lines to add pagination and control
          // pagination: const SwiperPagination(
          //   builder: DotSwiperPaginationBuilder(
          //     activeColor: Colors.white,
          //     color: Colors.grey,
          //   ),
          // ),
          // control: const SwiperControl(),
        ),
      ),
    );
  }
}
