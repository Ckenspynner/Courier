import 'dart:async';


import 'package:flutter/material.dart';

import '../../models/parcel.dart';
import '../parceleditscreen.dart'; // Import your Parcel class // Import ParcelEditScreen

class ParcelDetailScreen extends StatefulWidget {
  final Parcel parcel;

  ParcelDetailScreen({required this.parcel});

  @override
  _ParcelDetailScreenState createState() => _ParcelDetailScreenState();
}

class _ParcelDetailScreenState extends State<ParcelDetailScreen> {
  late Timer _timer;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startSlideshow() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % widget.parcel.imageUrls.length;
      });
    });
  }

  void _navigateToEditScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ParcelEditScreen(parcel: widget.parcel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Parcel Number: ${widget.parcel.parcelNumber}'),
            Text('Parcel Title: ${widget.parcel.parcelTitle}'),
            Text('Sender: ${widget.parcel.senderName}'),
            Text('Sender Address: ${widget.parcel.senderAddress}'),
            Text('Recipient: ${widget.parcel.recipientName}'),
            Text('Recipient Address: ${widget.parcel.recipientAddress}'),
            Text('Amount: ${widget.parcel.amount}'),
            Text('Weight: ${widget.parcel.weight}'),
            Text('Status: ${widget.parcel.status}'),
            Text('Last Location: ${widget.parcel.getLastBranch()}'),
            if (widget.parcel.imageUrls.isNotEmpty) // Display images
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text('Images:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    height: 100, // Adjust the height of the image list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.parcel.imageUrls.length,
                      itemBuilder: (context, index) {
                        String imageUrl = widget.parcel.imageUrls[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(
                              imageUrl,
                              height: 100, // Adjust the height of each image
                              width: 100, // Adjust the width of each image
                              fit: BoxFit.cover, // Make sure images cover the entire space
                              color: _currentImageIndex == index ? Colors.blue : null, // Change the border color if image is selected
                              colorBlendMode: _currentImageIndex == index ? BlendMode.color : null, // Apply blend mode to make the border color effective
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  // Display the selected image in a bigger size
                  Image.network(
                    widget.parcel.imageUrls[_currentImageIndex],
                    height: 200, // Adjust the height of the selected image
                    width: double.infinity, // Take the full width of the screen
                    fit: BoxFit.cover, // Make sure image covers the entire space
                  ),
                ],
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToEditScreen,
              child: Text('Edit Parcel'),
            ),
          ],
        ),
      ),
    );
  }
}
