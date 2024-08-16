import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/http_strings.dart';

class Parcel {
  final int id;
  final String parcelNumber;
  final String parcelTitle;
  final String senderName;
  final String senderAddress;
  final String senderLocation;
  final String recipientName;
  final String recipientAddress;
  final String recipientLocation;
  final double amount;
  final double weight;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String branch;
  final String destinationbranch;
  final List<String> imageUrls;
  final List<Movement> movements;

  Parcel({
    required this.id,
    required this.parcelNumber,
    required this.parcelTitle,
    required this.senderName,
    required this.senderAddress,
    required this.senderLocation,
    required this.recipientName,
    required this.recipientAddress,
    required this.recipientLocation,
    required this.amount,
    required this.weight,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.branch,
    required this.destinationbranch,
    required this.imageUrls,
    required this.movements,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    List<String> urls = (json['images'] as List<dynamic>).map((image) => baseUrl + image['image']).toList();
    List<Movement> movements = (json['movements'] as List<dynamic>).map((m) => Movement.fromJson(m)).toList();

    return Parcel(
      id: json['id'],
      parcelNumber: '${json['parcel_number']}',
      parcelTitle: json['parcel_title'],
      senderName: json['sender_name'],
      senderAddress: json['sender_address'],
      senderLocation: json['sender_location'],
      recipientName: json['recipient_name'],
      recipientAddress: json['recipient_address'],
      recipientLocation: json['recipient_location'],
      amount: double.parse(json['amount']),
      weight: double.parse(json['weight']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      branch: json['branch'],
      destinationbranch: json['destination_branch'],
      imageUrls: urls,
      movements: movements,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parcel_number': parcelNumber,
      'parcel_title': parcelTitle,
      'sender_name': senderName,
      'sender_address': senderAddress,
      'sender_location': senderLocation,
      'recipient_name': recipientName,
      'recipient_address': recipientAddress,
      'recipient_location': recipientLocation,
      'amount': amount,
      'weight': weight,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'branch': branch,
      'destination_branch': destinationbranch,
      'image_urls': imageUrls,
      'movements': movements.map((m) => m.toJson()).toList(),
    };
  }

  String getFirstBranch() {
    return movements.isNotEmpty ? movements.first.branch : 'N/A';
  }

  String getLastBranch() {
    return movements.isNotEmpty ? movements.last.branch : 'N/A';
  }
}
class Movement {
  final String branch;
  final String gpsLocation;  // New field added for GPS location
  final DateTime timestamp;

  Movement({
    required this.branch,
    required this.gpsLocation,  // Include in constructor
    required this.timestamp,
  });

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      branch: json['branch'],
      gpsLocation: json['gps_location'],  // Parse the GPS location from JSON
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branch': branch,
      'gps_location': gpsLocation,  // Include in JSON serialization
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

Future<List<Parcel>> fetchParcels() async {
  final response = await http.get(Uri.parse(parcels_list));

  if (response.statusCode == 200) {
    final List<dynamic> parcelsJson = jsonDecode(response.body);
    return parcelsJson.map((json) => Parcel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load parcels');
  }
}
