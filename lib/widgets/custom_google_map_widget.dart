import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatefulWidget {
  final double lat;
  final double long;
  final double? zoom;
  final Set<Circle>? radiusCircle;
  const CustomGoogleMapWidget(
      {super.key,
      required this.lat,
      required this.long,
      this.radiusCircle,
      this.zoom});

  @override
  State<CustomGoogleMapWidget> createState() => _CustomGoogleMapWidgetState();
}

class _CustomGoogleMapWidgetState extends State<CustomGoogleMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late final CameraPosition kGooglePlex;
  // static const CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  void initState() {
    super.initState();
    kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.long),
      zoom: widget.zoom ?? 15.4746,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      compassEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: kGooglePlex,
      circles: widget.radiusCircle ?? const <Circle>{},
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
