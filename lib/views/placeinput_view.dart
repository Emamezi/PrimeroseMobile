import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:primerose_mobile/model/place.dart';
import '../views/imageinput_view.dart';
import 'package:provider/provider.dart';
import '../provider/places.dart';

class PlaceInputView extends StatefulWidget {
  static const routeName = 'place-input';
  @override
  _PlaceInputViewState createState() => _PlaceInputViewState();
}

class _PlaceInputViewState extends State<PlaceInputView> {
  final _titleController = TextEditingController();
  File _takenImage;
  PlaceLocation location;
  void _savePlace() {
//Validation logic before submitting
    if (_titleController.text.isEmpty ||
        _takenImage == null ||
        location == null) {
      return;
      //TODO:Add Error Handling Message
    }
    Provider.of<Places>(context, listen: false)
        .addPlace(_titleController.text, _takenImage, location);
    Navigator.of(context).pop();
  }

  void onSelectImage(File takenImage) {
    _takenImage = takenImage;
  }

  Future<void> getPlaceLocation() async {
    final locationData = await Location().getLocation();
    final newLocation = PlaceLocation(
      longitude: locationData.longitude,
      latitude: locationData.latitude,
    );
    location = newLocation;
  }

  @override
  void initState() {
    super.initState();
    getPlaceLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Save Place',
            onPressed: _savePlace,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter place',
                  focusColor: Theme.of(context).appBarTheme.color,
                  prefixIcon: Icon(Icons.place),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                controller: _titleController,
              ),
            ),
            SizedBox(height: 20),
            ImageInput(onSelectImage),
          ],
        ),
      ),
    );
  }
}
