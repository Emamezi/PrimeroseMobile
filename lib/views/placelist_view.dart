import 'package:flutter/material.dart';
import 'package:primerose_mobile/provider/places.dart';
import 'package:primerose_mobile/views/place_detail_view.dart';
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
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchAndGetData(),
        builder: (ctx, placeSnapShot) => placeSnapShot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<Places>(
                child: Center(child: Text('No places added yet')),
                builder: (ctx, place, ch) => place.places.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: place.places.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(place.places[i].image),
                          ),
                          title: Text(place.places[i].title),
                          subtitle: Text(place.places[i].userlocation.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PlaceDetailView.routeName,
                                arguments: place.places[i].id);
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
