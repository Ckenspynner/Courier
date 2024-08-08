import 'package:courier_frontend/src/screens/home/parcelhomepage.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
//#1C274C
class MyApp extends StatelessWidget {
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













