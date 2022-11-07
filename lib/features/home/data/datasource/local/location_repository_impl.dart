import 'package:geolocator/geolocator.dart';
import '../../../domain/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Position?> getUserCurrentLocation() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // Permission Denied Message
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _openLocationSettings();
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // Permission Denied Message
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // Permission Denied Forever Message

      return false;
    } else {
      return false;
    }
  }

  @override
  Future<Position?> getLastKnownPosition() async {
    return await Geolocator.getLastKnownPosition();
  }

  void _openLocationSettings() async {
    final opened = await Geolocator.openLocationSettings();
    String displayValue;
    if (opened) {
      displayValue = 'Opened Location Settings';
    } else {
      displayValue = 'Error opening Location Settings';
    }
  }
}
