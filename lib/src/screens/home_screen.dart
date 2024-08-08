import 'dart:async';
import 'package:courier_frontend/src/screens/shipment/parceldetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'addparcelscreen.dart';
import '../models/parcel.dart';

class ParcelListScreen extends StatefulWidget {
  @override
  _ParcelListScreenState createState() => _ParcelListScreenState();
}

class _ParcelListScreenState extends State<ParcelListScreen> {
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
    const refreshInterval = Duration(seconds: 20);
    _timer = Timer.periodic(refreshInterval, (Timer timer) {
      // Fetch parcels periodically
      setState(() {
        futureParcels = fetchParcels();
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Parcel screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddParcelScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Parcel>>(
        future: futureParcels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No parcels found'));
          } else {
            return ListView.builder(
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
                    title: Text(parcel.parcelTitle),
                    subtitle: Text('${parcel.parcelNumber}'),
                    trailing: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                      items: parcel.imageUrls.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // Add other parcel information to display in the list
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}
