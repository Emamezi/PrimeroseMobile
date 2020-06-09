import 'dart:io';
import 'package:flutter/foundation.dart';
import '../model/place.dart';

class Places with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        title: title,
        // address: address,
        image: image,
        location: null);

    _places.add(newPlace);
    notifyListeners();
  }
}
