import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String address;

  PlaceLocation({this.latitude, this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final String address;
  final PlaceLocation location;
  final File image;

  Place({
   @required this.id,
   @required this.title,
   this.address,
   @required this.image,
   @required this.location,
  });
}
