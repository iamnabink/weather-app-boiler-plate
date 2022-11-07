
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  /// Determine the current position of the local.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  ///
  Future<Position?> getUserCurrentLocation();

  Future<Position?> getLastKnownPosition();
}
