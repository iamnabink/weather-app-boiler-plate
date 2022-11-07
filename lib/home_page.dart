import 'package:flutter/material.dart';

// use use-effect to fetch api ?
// fetch api when value to text is saved/updated


// sample req -
// http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=London&aqi=no
// http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=48.8567,2.350
// docs - https://www.weatherapi.com/docs/#intro-request


//TODO: - Add required dependencies (Flutter Secure storage, riverpod,  Cached network, geolocator, pull_to_refresh, auto_route, pretty_dio_logger, dio, freeze, yaml
//TODO:  - Copy required Salesberry code
//TODO:  - Add swipe on refresh
//TODO:  - Add device preview
//TODO:  - Add sentry if possible
//TODO:  - Request for user permission
// TODO: -

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Starts from here',
            ),
          ],
        ),
      ),
    );
  }
}

/// Homepage Screen:
///
/*
=> Should contain text-box to enter location name (initially blank) and Save/Update button. If location name is blank, app should call weather api automatically with current latitude
and longitude of app.
Else app should call weather api with location name is entered and Save button is pressed.
=> If location name is entered it must be remembered on next launch
=> When location name text-box is empty, label of button must be Save; if value exist label should be changed to Update.
=> Show temperature view (use widget you see appropriate) in appropriate way to show temperature received from API.
=> When Save/Update button is clicked, if location name is empty or cannot get temperature from API display error message else update temperature view.
=> In top bar there should be button to open Help Screen (Note: Help Screen has similar behavior as mentioned above)
Temperature view must contain:
=> temperature in Celsius ( Eg: "temp_c": 8.0 in below sample response)
=> temperature in text (Eg: "text": "Clear" in below sample response)*/
