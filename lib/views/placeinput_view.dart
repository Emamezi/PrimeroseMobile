import 'dart:io';

import 'package:flutter/material.dart';
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
  File pickedImage;
  void selectImage(File pickedFile) {
    pickedImage = pickedFile;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || pickedImage == null) {
      return;
    }
    Provider.of<Places>(context, listen: false).addPlace(
      _titleController.text,
      pickedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _savePlace,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
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
            SizedBox(height: 20),
            ImageInput(selectImage),
          ],
        ),
      ),
    );
  }
}
