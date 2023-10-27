import 'package:automated_mobile_assistant/services/location_service.dart';

import 'condition.dart';
import 'package:geolocator/geolocator.dart';

class LocationCondition extends Condition {
  Position? position;

  LocationCondition(super.inverted, super.disabled);

  //A location request must be async
  @override
  bool isMet() {
    throw UnsupportedError("Implementation is async");
  }

  //Return true if the specified location and the current location are < 100m apart
  @override
  Future<bool> isMetAsync() async {
    bool returnValue = false;
    bool error = false;
    Position currentPosition;

    try {
      if (positionIsSet()) {
        LocationService locationService = LocationService();
        currentPosition = await locationService.determinePosition();

        double distance = Geolocator.distanceBetween(
            position!.latitude, position!.longitude, currentPosition.latitude,
            currentPosition.longitude);

        if (distance < 100) {
          returnValue = true;
        }
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

  //Check if the base position had been set yet
  bool positionIsSet() {
    return (position != null && position?.latitude != null && position?.longitude != null);
  }
}