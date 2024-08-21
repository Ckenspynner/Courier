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



// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Import for SvgPicture
//
// /// Flutter code sample for [PopupMenuButton].
//
// // This is the type used by the popup menu below.
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// void main() => runApp(const PopupMenuApp());
//
// class PopupMenuApp extends StatelessWidget {
//   const PopupMenuApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: PopupMenuExample(),
//     );
//   }
// }
//
// class PopupMenuExample extends StatefulWidget {
//   const PopupMenuExample({super.key});
//
//   @override
//   State<PopupMenuExample> createState() => _PopupMenuExampleState();
// }
//
// class _PopupMenuExampleState extends State<PopupMenuExample> {
//   SampleItem? selectedItem;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('PopupMenuButton')),
//       body: Center(
//         child: PopupMenuButton<SampleItem>(
//           initialValue: selectedItem,
//           onSelected: (SampleItem item) {
//             setState(() {
//               selectedItem = item;
//             });
//           },
//           icon: Container(
//             margin: const EdgeInsets.fromLTRB(0, 0.4, 0, 0.4),
//             width: 24, // Adjust width and height as needed
//             height: 24,
//             child: SvgPicture.asset(
//               'assets/vectors/group_338241_x2.svg',
//             ),
//           ),
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
//             const PopupMenuItem<SampleItem>(
//               value: SampleItem.itemOne,
//               child: Text('Item 1'),
//             ),
//             const PopupMenuItem<SampleItem>(
//               value: SampleItem.itemTwo,
//               child: Text('Item 2'),
//             ),
//             const PopupMenuItem<SampleItem>(
//               value: SampleItem.itemThree,
//               child: Text('Item 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
