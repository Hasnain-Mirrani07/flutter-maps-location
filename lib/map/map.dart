import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  //final Completer<GoogleMapController> _controller = Completer();

  //late GoogleMapController mapController;
  // Set<Marker> markers = {};
  // void onMapcreated(GoogleMapController controller) {
  //   setState(() {
  //     markers.add(const Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(13.007488, 77.598656),
  //       infoWindow: InfoWindow(
  //         title: 'Marker Title Second ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //     ));
  //     markers.add(const Marker(
  //       markerId: MarkerId('2'),
  //       position: LatLng(13.007481, 77.598651),
  //       infoWindow: InfoWindow(
  //         title: 'Marker Title Third ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //     ));
  //     markers.add(const Marker(
  //       markerId: MarkerId('3'),
  //       position: LatLng(13.001916, 77.588849),
  //       infoWindow: InfoWindow(
  //         title: 'Marker Title Fourth ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //     ));
  //   });
  // }

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
  List<Marker> markerlist = [];
  List<Marker> marker = [
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(47.42, 83.085),
        infoWindow: InfoWindow(title: "1 maker")),
    // const Marker(
    //     markerId: MarkerId("2"),
    //     position: LatLng(37.42, -122.085),
    //     infoWindow: InfoWindow(title: "2nd marker")),
    const Marker(
        markerId: MarkerId("11"),
        position: LatLng(37.42, 73.085),
        infoWindow: InfoWindow(title: "My Current Position")),
    // const Marker(
    //     markerId: MarkerId("22"),
    //     position: LatLng(37.738045, 73.084488),
    //     infoWindow: InfoWindow(title: "My 2nd Position"))
  ];
  List<Polyline> polylineList = [
    const Polyline(
        polylineId: PolylineId("polylineId"),
        points: [LatLng(37.42, 73.085), LatLng(47.42, 83.085)]),
    const Polyline(
        polylineId: PolylineId("polylineId"),
        points: [LatLng(36.43, 74.195), LatLng(46.43, 82.184)])
  ];
  // Polyline polyline = const Polyline(
  //     polylineId: PolylineId("polylineId"),
  //     points: [LatLng(37.42, 73.085), LatLng(47.42, 83.085)]);
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(47.42, 83.085),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);
  @override
  void initState() {
    polylineList;
    markerlist.addAll(marker);
    // TODO: implement initState
    super.initState();
    // marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: Set.of(polylineList),
        mapType: MapType.normal,
        initialCameraPosition: _kLake,
        markers: Set.of(marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lakee!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
