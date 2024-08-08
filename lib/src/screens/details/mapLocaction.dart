import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../../models/parcel.dart'; // Import Movement class
import '../../utils/constants.dart';
import '../../utils/http_strings.dart';

class LocationDetails extends StatefulWidget {
  final List<Movement> movements; // Accept a list of Movement objects
  final Parcel parcel;

  const LocationDetails(
      {super.key, required this.movements, required this.parcel});

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  List<LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    _getRoute();
  }

  Future<void> _getRoute() async {
    for (int i = 0; i < widget.movements.length - 1; i++) {
      final Movement startMovement = widget.movements[i];
      final Movement endMovement = widget.movements[i + 1];

      final startLatLng = LatLng(
        double.parse(startMovement.gpsLocation.split(',')[0]),
        double.parse(startMovement.gpsLocation.split(',')[1]),
      );
      final endLatLng = LatLng(
        double.parse(endMovement.gpsLocation.split(',')[0]),
        double.parse(endMovement.gpsLocation.split(',')[1]),
      );

      final String url =
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${startLatLng.longitude},${startLatLng.latitude}&end=${endLatLng.longitude},${endLatLng.latitude}';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> coordinates =
        data['features'][0]['geometry']['coordinates'];

        setState(() {
          routePoints.addAll(
            coordinates.map((point) => LatLng(point[1], point[0])).toList(),
          );
        });
      } else {
        throw Exception(
            'Failed to load route between ${startMovement.branch} and ${endMovement.branch}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-1.286389, 36.817223),
        // Center the map around Nairobi, Kenya
        initialZoom: 7.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://mt.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
        ),
        CircleLayer(
          circles: widget.movements.asMap().entries.map((entry) {
            final int index = entry.key;
            final Movement movement = entry.value;
            final latLng = LatLng(
              double.parse(movement.gpsLocation.split(',')[0]),
              double.parse(movement.gpsLocation.split(',')[1]),
            );

            // Set color based on whether it's the first, last, or another marker
            Color color;
            if (index == 0) {
              color = Colors.blue; // First marker
            } else if (index == widget.movements.length - 1 &&
                widget.parcel.branch ==
                    widget.movements[widget.movements.length - 1].branch) {
              color = Colors.green; // Last marker
            } else {
              color = Colors.black; // Other markers
            }
            return CircleMarker(
              point: latLng,
              color: color,
              radius: 8,
            );
          }).toList(),
        ),
        if (routePoints.isNotEmpty)
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                color: AppColors.primaryColor,
                strokeWidth: 4.0,
              ),
            ],
          ),
      ],
    );
  }
}