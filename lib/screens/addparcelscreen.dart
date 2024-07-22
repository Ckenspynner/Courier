import 'dart:convert';
import 'dart:io';
import 'package:courier_frontend/utils/http_strings.dart'; // Ensure this path is correct
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class AddParcelScreen extends StatefulWidget {
  @override
  _AddParcelScreenState createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {
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

  List<String> _locations = []; // List to store locations fetched from backend
  Map<String, String> _statusChoices = {}; // Map to store status choices fetched from backend

  @override
  void initState() {
    super.initState();
    fetchLocations(); // Fetch locations when the screen initializes
    fetchStatusChoices(); // Fetch status choices when the screen initializes

    // Add a listener to the weight controller to update the amount
    _weightController.addListener(_updateAmount);
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
    final parcelData = {
      'parcel_title': _parcelTitleController.text,
      'sender_name': _senderNameController.text,
      'sender_address': _senderAddressController.text,
      'recipient_name': _recipientNameController.text,
      'recipient_address': _recipientAddressController.text,
      'amount': _amountController.text,
      'weight': _weightController.text,
      'status': _statusController.text,
      'parcel_last_location': _parcelLastLocationController.text,
      // Add other parcel details here...
    };

    final multipartRequest = http.MultipartRequest(
      'POST',
      Uri.parse(create_parcel), // Ensure this URL is correct
    );

    // Add text fields to the request
    parcelData.forEach((key, value) {
      multipartRequest.fields[key] = value;
    });

    // Add images to the request
    for (int i = 0; i < _imageFiles.length; i++) {
      final imageFile = _imageFiles[i];
      final imageStream = http.ByteStream(imageFile.openRead());
      final imageLength = await imageFile.length();

      final imageName = 'image$i.jpg';

      multipartRequest.files.add(
        http.MultipartFile(
          'images',
          imageStream,
          imageLength,
          filename: imageName,
        ),
      );
    }

    try {
      final response = await http.Response.fromStream(await multipartRequest.send());

      if (response.statusCode == 201) {
        // Parcel saved successfully
        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Parcel saved successfully')),
        );
      } else {
        // Error saving parcel
        // Show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save parcel')),
        );
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request
      print('Error saving parcel: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving parcel')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Parcel'),
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
                  value: entry.key,
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
