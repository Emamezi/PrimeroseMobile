import 'dart:io';

import 'package:flutter/material.dart';
import 'package:primerose_mobile/model/place.dart';
import 'package:primerose_mobile/provider/places.dart';
import 'package:primerose_mobile/views/map_view.dart';
import 'package:provider/provider.dart';

class PlaceDetailView extends StatelessWidget {
  static const routeName = 'place-detail';
  @override
  Widget build(BuildContext context) {
    final placeId = ModalRoute.of(context).settings.arguments as String;
    final locationData =
        Provider.of<Places>(context, listen: false).findById(placeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(locationData.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(locationData.image,
                fit: BoxFit.cover, width: double.infinity),
          ),
          Text(
            locationData.userlocation.address,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      MapView(userPosition: locationData.userlocation),
                ),
              );
            },
            child: Text('View on Map'),
          )
        ],
      ),
    );
  }
}
