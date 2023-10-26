import 'condition.dart';
import 'package:geolocator/geolocator.dart';

class LocationCondition extends Condition {
  Position setPosition;

  LocationCondition(super.inverted, super.disabled, this.setPosition);

  //A location request must be async
  @override
  bool isMet() {
    throw UnsupportedError("Implementation is async");
  }

  //Return true if the specified location and the current location are < 100m apart
  Future<bool> isMetAsync() async {
    bool returnValue = false;
    bool error = false;
    Position currentPosition;

    try {
      currentPosition =  await _determinePosition();
      double distance = Geolocator.distanceBetween(setPosition.latitude, setPosition.longitude, currentPosition.latitude, currentPosition.longitude);

      if (distance < 100) {
        returnValue = true;
      }
    }
    catch (e) {
     //Will return false if there's an error
    }

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }

  //Below code is sourced from https://pub.dev/packages/geolocator

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}