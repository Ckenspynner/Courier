import 'package:courier_frontend/src/models/parcel.dart';
import 'package:flutter/material.dart'; // Import your Parcel model

class ParcelTrackingPage extends StatelessWidget {
  final Parcel parcel; // Pass the parcel data to this page

  ParcelTrackingPage({required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel Tracking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parcel Number: ${parcel.parcelNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Current Status: ${parcel.status}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Parcel Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Title: ${parcel.parcelTitle}'),
            Text('Sender: ${parcel.senderName}'),
            Text('Sender Address: ${parcel.senderAddress}'),
            Text('Recipient: ${parcel.recipientName}'),
            Text('Recipient Address: ${parcel.recipientAddress}'),
            Text('Amount: \$${parcel.amount.toStringAsFixed(2)}'),
            Text('Weight: ${parcel.weight.toString()} kg'),
            SizedBox(height: 20),
            Text(
              'Journey Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Display journey details here, such as locations and timestamps
            // You can use ListView, DataTable, or any other suitable widget
            // Example:
            // ListView.builder(
            //   itemCount: parcel.journey.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(parcel.journey[index].location),
            //       subtitle: Text(parcel.journey[index].timestamp),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
