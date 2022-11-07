/// Author:    Nabraj Khadka
/// Created:   17.01.2022
/// Description:

///

import 'package:flutter_dotenv/flutter_dotenv.dart';

// sample req -
// http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=London&aqi=no
// http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=48.8567,2.350
// docs - https://www.weatherapi.com/docs/#intro-request

enum APIPath {
  // * by city location
  byCityLocation,
  // * by Latitude and Longitude
  byLatLon
}

class APIPathHelper {
  // global api base url
  static final String baseUrl = dotenv.env['BASE_URL'] ?? "";
  static final String apiKey = dotenv.env['OPEN_API_KEY'] ?? "";

  static String currentWeather(APIPath path,
      {String? location, String? latLon}) {
    switch (path) {
      case APIPath.byCityLocation:
        return "/current.json?key=$apiKey&q=$location&aqi=no";
      case APIPath.byLatLon:
        return "/current.json?key=$apiKey&q=$latLon";
      default:
        return "";
    }
  }
}
