import 'package:http/http.dart' as http;
import 'dart:convert';

const GOOGLE_API_KEY = 'AIzaSyAxo845s1oRZruaytC1RtGxOAgUiiqcBhk';

class LocationHelper {
  Future<String> getUserPlaceAddress(
      {double latitude, double longitude}) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
    // print(json.decode(response.body)['results'][0]['formatted_addres']);
  }
}
