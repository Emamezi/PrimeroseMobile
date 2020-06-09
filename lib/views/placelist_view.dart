import 'package:flutter/material.dart';
import 'package:primerose_mobile/provider/places.dart';
import '../views/placeinput_view.dart';
import 'package:provider/provider.dart';

class PlaceListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrimeRose Mobile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(PlaceInputView.routeName);
            },
          )
        ],
      ),
      body: Consumer<Places>(
        builder: (ctx, place, ch) => ListView.builder(
            itemCount: place.places.length,
            itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(place.places[i].image),
                  ),
                  title: Text(place.places[i].title),
                  trailing: Text(place.places[i].id),
                )),
      ),
    );
  }
}
