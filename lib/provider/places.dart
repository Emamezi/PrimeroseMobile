import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:primerose_mobile/helper/locationhelper.dart';
import '../model/place.dart';
import '../helper/dbhelper.dart';

class Places with ChangeNotifier {
  List<Place> _places = [];
//Adding a getter to retrive a copy of places so as not to change data from outside this class
  List<Place> get places {
    return [..._places];
  }

  // A method to add places to the _placeslist
  void addPlace(String title, File placeImage, PlaceLocation location) async {
    final userAddress = await LocationHelper().getUserPlaceAddress(
        latitude: location.latitude, longitude: location.longitude);
    final updatedLocation = PlaceLocation(
        longitude: location.longitude,
        latitude: location.latitude,
        address: userAddress);
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: title,
      image: placeImage,
      userlocation: updatedLocation,
    );
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'placeImage': newPlace.image.path,
      'loc_lat': newPlace.userlocation.latitude,
      'loc_long': newPlace.userlocation.longitude,
      'address': newPlace.userlocation.address
    });
  }

  Future<void> fetchAndGetData() async {
    final dataList = await DBHelper.getData('places');
    dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            userlocation: PlaceLocation(
                longitude: item['loc_long'],
                latitude: item['loc_lat'],
                address: item['address']),
            image: File(item['placeImage']),
          ),
        )
        .toList()
        .reversed;
    notifyListeners();
  }

  Place findById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }
}
