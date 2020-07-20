import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String address;

  PlaceLocation({
    @required this.longitude,
    @required this.latitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation userlocation;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.userlocation,
    @required this.image,
  });
}
