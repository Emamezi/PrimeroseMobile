import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:primerose_mobile/model/place.dart';

class MapView extends StatefulWidget {
  static const routeName = 'map-screen';

  final PlaceLocation userPosition;

  MapView({this.userPosition});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // final LatLng clientLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Map Locatoion'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            zoom: 16,
            target: LatLng(
                widget.userPosition.latitude, widget.userPosition.longitude)),
        markers: {
          Marker(
            markerId: MarkerId('m1'),
            position: LatLng(
                widget.userPosition.latitude, widget.userPosition.longitude),
          ),
        },
      ),
    );
  }
}
