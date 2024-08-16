import 'package:barcode_widget/barcode_widget.dart';
import 'package:courier_frontend/src/screens/home/parcelhomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//#1C274C
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ParcelHomePage(),
    );
  }

}
