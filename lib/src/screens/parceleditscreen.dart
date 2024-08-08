// import 'dart:convert';
// import 'dart:io';
// import 'package:courier_frontend/src/models/parcel.dart';
// import 'package:courier_frontend/src/utils/http_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// class ParcelEditScreen extends StatefulWidget {
//   final Parcel parcel; // Pass the existing parcel data to edit
//
//   ParcelEditScreen({required this.parcel});
//
//   @override
//   _ParcelEditScreenState createState() => _ParcelEditScreenState();
// }
//
// class _ParcelEditScreenState extends State<ParcelEditScreen> {
//   final TextEditingController _parcelTitleController = TextEditingController();
//   final TextEditingController _senderNameController = TextEditingController();
//   final TextEditingController _senderAddressController = TextEditingController();
//   final TextEditingController _recipientNameController = TextEditingController();
//   final TextEditingController _recipientAddressController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   final TextEditingController _statusController = TextEditingController();
//   final TextEditingController _parcelLastLocationController = TextEditingController();
//   List<File> _imageFiles = [];
//
//   List<String> _locations = [];
//   Map<String, String> _statusChoices = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _populateFields();
//     fetchLocations();
//     fetchStatusChoices();
//     _weightController.addListener(_updateAmount);
//   }
//
//   void _populateFields() {
//     _parcelTitleController.text = widget.parcel.parcelTitle;
//     _senderNameController.text = widget.parcel.senderName;
//     _senderAddressController.text = widget.parcel.senderAddress;
//     _recipientNameController.text = widget.parcel.recipientName;
//     _recipientAddressController.text = widget.parcel.recipientAddress;
//     _amountController.text = widget.parcel.amount.toString();
//     _weightController.text = widget.parcel.weight.toString();
//     _statusController.text = widget.parcel.status;
//     _parcelLastLocationController.text = widget.parcel.parcelLastLocation;
//     // You might need to handle images separately based on your implementation
//     // _imageFiles = widget.parcel.images;
//   }
//
//   Future<void> fetchLocations() async {
//     try {
//       final response = await http.get(Uri.parse(parcel_locations));
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final List<dynamic> locationsJson = jsonDecode(response.body);
//
//         // Extract location names
//         setState(() {
//           _locations = locationsJson.map((location) => location['name'] as String).toList();
//         });
//       } else {
//         // Handle error
//         throw Exception('Failed to load locations');
//       }
//     } catch (e) {
//       // Handle any errors that occurred during the HTTP request
//       print('Error fetching locations: $e');
//     }
//   }
//
//   Future<void> fetchStatusChoices() async {
//     try {
//       final response = await http.get(Uri.parse(status_choices));
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final List<dynamic> statusChoicesJson = jsonDecode(response.body);
//
//         // Extract status choices
//         setState(() {
//           _statusChoices = {
//             for (var choice in statusChoicesJson)
//               choice['id'].toString(): choice['status']
//           };
//         });
//       } else {
//         // Handle error
//         throw Exception('Failed to load status choices');
//       }
//     } catch (e) {
//       // Handle any errors that occurred during the HTTP request
//       print('Error fetching status choices: $e');
//     }
//   }
//
//   Future<void> _updateAmount() async {
//     final weightText = _weightController.text;
//     if (weightText.isEmpty) {
//       _amountController.clear();
//       return;
//     }
//     final weight = double.tryParse(weightText);
//     if (weight == null) {
//       _amountController.clear();
//       return;
//     }
//     final response = await http.get(Uri.parse('$get_cost_for_weight?weight=$weight'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _amountController.text = data['cost'].toString();
//       });
//     } else {
//       print('Failed to fetch cost for weight');
//       _amountController.clear();
//     }
//   }
//
//   Future<void> _pickImages(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//
//     if (pickedFile != null) {
//       File? croppedFile = await _cropImage(File(pickedFile.path));
//       if (croppedFile != null) {
//         setState(() {
//           _imageFiles.add(croppedFile);
//         });
//       }
//     }
//   }
//
//   Future<File?> _cropImage(File imageFile) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
//       compressQuality: 100,
//       maxWidth: 700,
//       maxHeight: 700,
//       compressFormat: ImageCompressFormat.jpg,
//     );
//
//     return croppedFile != null ? File(croppedFile.path) : null;
//   }
//
//
//   Future<void> _saveParcel() async {
//     final url = Uri.parse('${update_parcel}/${widget.parcel.id}/');
//     final request = http.MultipartRequest('PUT', url)
//       ..fields['parcel_title'] = _parcelTitleController.text
//       ..fields['sender_name'] = _senderNameController.text
//       ..fields['sender_address'] = _senderAddressController.text
//       ..fields['recipient_name'] = _recipientNameController.text
//       ..fields['recipient_address'] = _recipientAddressController.text
//       ..fields['weight'] = _weightController.text
//       ..fields['amount'] = _amountController.text
//       ..fields['status'] = _statusController.text
//       ..fields['parcel_last_location'] = _parcelLastLocationController.text;
//
//     for (var file in _imageFiles) {
//       request.files.add(await http.MultipartFile.fromPath('images', file.path));
//     }
//
//     final response = await request.send();
//     if (response.statusCode == 200) {
//       // Handle success
//       Navigator.of(context).pop();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Parcel update successfully')),
//       );
//     } else {
//       // Error saving parcel
//       // Show error message to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to update parcel')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Parcel'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _parcelTitleController,
//               decoration: InputDecoration(labelText: 'Parcel Title'),
//             ),
//             TextField(
//               controller: _senderNameController,
//               decoration: InputDecoration(labelText: 'Sender Name'),
//             ),
//             TextField(
//               controller: _senderAddressController,
//               decoration: InputDecoration(labelText: 'Sender Address'),
//             ),
//             TextField(
//               controller: _recipientNameController,
//               decoration: InputDecoration(labelText: 'Recipient Name'),
//             ),
//             TextField(
//               controller: _recipientAddressController,
//               decoration: InputDecoration(labelText: 'Recipient Address'),
//             ),
//             TextField(
//               controller: _weightController,
//               decoration: InputDecoration(labelText: 'Weight'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _amountController,
//               decoration: InputDecoration(labelText: 'Amount'),
//               readOnly: true,
//             ),
//             DropdownButtonFormField<String>(
//               value: _statusController.text.isNotEmpty ? _statusController.text : null,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _statusController.text = newValue ?? '';
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Status'),
//               items: _statusChoices.entries.map<DropdownMenuItem<String>>((entry) {
//                 return DropdownMenuItem<String>(
//                   value: entry.value, // Ensure unique value
//                   child: Text(entry.value),
//                 );
//               }).toList(),
//             ),
//             DropdownButtonFormField<String>(
//               value: _parcelLastLocationController.text.isNotEmpty ? _parcelLastLocationController.text : null,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _parcelLastLocationController.text = newValue ?? '';
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Last Location'),
//               items: _locations.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickImages(ImageSource.gallery),
//                   child: Text('Select Image'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _pickImages(ImageSource.camera),
//                   child: Text('Take Picture'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             if (_imageFiles.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Selected Images:'),
//                   SizedBox(height: 8),
//                   Wrap(
//                     spacing: 8,
//                     children: _imageFiles.map((file) => Image.file(file, height: 100)).toList(),
//                   ),
//                 ],
//               ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _saveParcel,
//               child: Text('Save Parcel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:courier_frontend/src/models/parcel.dart';
import 'package:courier_frontend/src/utils/http_strings.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ParcelEditScreen extends StatefulWidget {
  final Parcel parcel; // Pass the existing parcel data to edit

  ParcelEditScreen({required this.parcel});

  @override
  _ParcelEditScreenState createState() => _ParcelEditScreenState();
}

class _ParcelEditScreenState extends State<ParcelEditScreen> {
  final TextEditingController _parcelTitleController = TextEditingController();
  final TextEditingController _senderNameController = TextEditingController();
  final TextEditingController _senderAddressController = TextEditingController();
  final TextEditingController _recipientNameController = TextEditingController();
  final TextEditingController _recipientAddressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _parcelLastLocationController = TextEditingController();
  List<File> _imageFiles = [];

  List<String> _locations = [];
  Map<String, String> _statusChoices = {};

  @override
  void initState() {
    super.initState();
    _populateFields();
    fetchLocations();
    fetchStatusChoices();
    _weightController.addListener(_updateAmount);
  }

  void _populateFields() {
    _parcelTitleController.text = widget.parcel.parcelTitle;
    _senderNameController.text = widget.parcel.senderName;
    _senderAddressController.text = widget.parcel.senderAddress;
    _recipientNameController.text = widget.parcel.recipientName;
    _recipientAddressController.text = widget.parcel.recipientAddress;
    _amountController.text = widget.parcel.amount.toString();
    _weightController.text = widget.parcel.weight.toString();
    _statusController.text = widget.parcel.status;
    _parcelLastLocationController.text = widget.parcel.getLastBranch(); // Extracting the name
    // You might need to handle images separately based on your implementation
    // _imageFiles = widget.parcel.images;
  }

  Future<void> fetchLocations() async {
    try {
      final response = await http.get(Uri.parse(parcel_locations));
      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> locationsJson = jsonDecode(response.body);

        // Extract location names
        setState(() {
          _locations = locationsJson.map((location) => location['name'] as String).toList();
        });
      } else {
        // Handle error
        throw Exception('Failed to load locations');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request
      print('Error fetching locations: $e');
    }
  }

  Future<void> fetchStatusChoices() async {
    try {
      final response = await http.get(Uri.parse(status_choices));
      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> statusChoicesJson = jsonDecode(response.body);

        // Extract status choices
        setState(() {
          _statusChoices = {
            for (var choice in statusChoicesJson)
              choice['id'].toString(): choice['status']
          };
        });
      } else {
        // Handle error
        throw Exception('Failed to load status choices');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request
      print('Error fetching status choices: $e');
    }
  }

  Future<void> _updateAmount() async {
    final weightText = _weightController.text;
    if (weightText.isEmpty) {
      _amountController.clear();
      return;
    }
    final weight = double.tryParse(weightText);
    if (weight == null) {
      _amountController.clear();
      return;
    }
    final response = await http.get(Uri.parse('$get_cost_for_weight?weight=$weight'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _amountController.text = data['cost'].toString();
      });
    } else {
      print('Failed to fetch cost for weight');
      _amountController.clear();
    }
  }

  Future<void> _pickImages(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          _imageFiles.add(croppedFile);
        });
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      compressQuality: 100,
      maxWidth: 700,
      maxHeight: 700,
      compressFormat: ImageCompressFormat.jpg,
    );

    return croppedFile != null ? File(croppedFile.path) : null;
  }

  Future<void> _saveParcel() async {
    final url = Uri.parse('${update_parcel}/${widget.parcel.id}/');
    final request = http.MultipartRequest('PUT', url)
      ..fields['parcel_title'] = _parcelTitleController.text
      ..fields['sender_name'] = _senderNameController.text
      ..fields['sender_address'] = _senderAddressController.text
      ..fields['recipient_name'] = _recipientNameController.text
      ..fields['recipient_address'] = _recipientAddressController.text
      ..fields['weight'] = _weightController.text
      ..fields['amount'] = _amountController.text
      ..fields['status'] = _statusController.text
      ..fields['parcel_last_location'] = _parcelLastLocationController.text;

    for (var file in _imageFiles) {
      request.files.add(await http.MultipartFile.fromPath('images', file.path));
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      // Handle success
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Parcel updated successfully')),
      );
    } else {
      // Error saving parcel
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update parcel')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Parcel'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _parcelTitleController,
              decoration: InputDecoration(labelText: 'Parcel Title'),
            ),
            TextField(
              controller: _senderNameController,
              decoration: InputDecoration(labelText: 'Sender Name'),
            ),
            TextField(
              controller: _senderAddressController,
              decoration: InputDecoration(labelText: 'Sender Address'),
            ),
            TextField(
              controller: _recipientNameController,
              decoration: InputDecoration(labelText: 'Recipient Name'),
            ),
            TextField(
              controller: _recipientAddressController,
              decoration: InputDecoration(labelText: 'Recipient Address'),
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              readOnly: true,
            ),
            DropdownButtonFormField<String>(
              value: _statusController.text.isNotEmpty ? _statusController.text : null,
              onChanged: (String? newValue) {
                setState(() {
                  _statusController.text = newValue ?? '';
                });
              },
              decoration: InputDecoration(labelText: 'Status'),
              items: _statusChoices.entries.map<DropdownMenuItem<String>>((entry) {
                return DropdownMenuItem<String>(
                  value: entry.value, // Ensure unique value
                  child: Text(entry.value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              value: _parcelLastLocationController.text.isNotEmpty ? _parcelLastLocationController.text : null,
              onChanged: (String? newValue) {
                setState(() {
                  _parcelLastLocationController.text = newValue ?? '';
                });
              },
              decoration: InputDecoration(labelText: 'Last Location'),
              items: _locations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImages(ImageSource.gallery),
                  child: Text('Select Image'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImages(ImageSource.camera),
                  child: Text('Take Picture'),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (_imageFiles.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Images:'),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _imageFiles.map((file) => Image.file(file, height: 100)).toList(),
                  ),
                ],
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveParcel,
              child: Text('Save Parcel'),
            ),
          ],
        ),
      ),
    );
  }
}
