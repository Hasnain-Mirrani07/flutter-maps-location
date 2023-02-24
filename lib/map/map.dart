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

  late GoogleMapController mapController;
  Set<Marker> markers = {};
  void onMapcreated(GoogleMapController controller) {
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('1'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('2'),
        position: LatLng(13.007481, 77.598651),
        infoWindow: InfoWindow(
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('3'),
        position: LatLng(13.001916, 77.588849),
        infoWindow: InfoWindow(
          title: 'Marker Title Fourth ',
          snippet: 'My Custom Subtitle',
        ),
      ));
    });
  }

  // static const CameraPosition _kGooglePlex =
  //     CameraPosition(target: LatLng(33.7468, -74.376), zoom: 12);

  // List<Marker> marker = [];
  // final List<Marker> _list = [
  //   const Marker(
  //       markerId: MarkerId("1"),
  //       position: LatLng(37.42, 73.085),
  //       infoWindow: InfoWindow(title: "My Current Position")),
  //   const Marker(
  //       markerId: MarkerId("2"),
  //       position: LatLng(37.738045, 73.084488),
  //       infoWindow: InfoWindow(title: "My 2nd Position"))
  // ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(13.007481, 77.598656),
            zoom: 10,
          ),
          mapToolbarEnabled: true,
          buildingsEnabled: false,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          markers: markers,
          onMapCreated: onMapcreated,
          zoomControlsEnabled: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_disabled_outlined),
          onPressed: () async {
            GoogleMapController controller = await Completer().future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                    target: LatLng(13.001916, 77.588849), zoom: 14)));
            setState(() {});
          }),
    );
  }
}
