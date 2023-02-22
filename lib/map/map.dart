import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6468, -73.0376), zoom: 12);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
