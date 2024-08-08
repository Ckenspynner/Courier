import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/http_strings.dart';

class Branch {
  final int id;
  final String name;
  final String address;
  final String contactNumber;
  final String gpsLocation;
  final String email;
  final Location? location;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.gpsLocation,
    required this.email,
    this.location,
  });

  // Factory method to create a Branch object from a JSON map
  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      contactNumber: json['contact_number'],
      gpsLocation: json['gps_location'],
      email: json['email'],
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  // Method to convert a Branch object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'contact_number': contactNumber,
      'gps_location': gpsLocation,
      'email': email,
      'location': location?.toJson(),
    };
  }
}

class Location {
  final int id;
  final String name;

  Location({
    required this.id,
    required this.name,
  });

  // Factory method to create a Location object from a JSON map
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
    );
  }

  // Method to convert a Location object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

Future<List<Branch>> fetchBranches() async {
  final response = await http.get(Uri.parse(branches_list)); // Replace branches_list with your API endpoint URL

  if (response.statusCode == 200) {
    final List<dynamic> branchesJson = jsonDecode(response.body);
    return branchesJson.map((json) => Branch.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load branches');
  }
}
