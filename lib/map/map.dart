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
      CameraPosition(target: LatLng(33.7468, -74.376), zoom: 12);

  List<Marker> marker = [];
  final List<Marker> _list = [
    const Marker(markerId: MarkerId("1"), position: LatLng(37.42, -122.085))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set.of(marker),
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
