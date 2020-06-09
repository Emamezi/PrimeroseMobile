import 'package:flutter/material.dart';
import './provider/places.dart';
import './views/placeinput_view.dart';
import './views/placelist_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'PrimeRoase Mobile',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          color: Colors.brown,
        )),
        home: PlaceListView(),
        routes: {
          PlaceInputView.routeName: (ctx) => PlaceInputView(),
        },
      ),
    );
  }
}
