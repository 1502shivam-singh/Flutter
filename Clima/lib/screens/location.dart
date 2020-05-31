import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longtitude;

  Future<double> getlocationlat() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      return _latitude;
     } catch (e) {
       print(e);
     }
  }

    Future<double> getlocationlong() async {
     try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     _longtitude = position.longitude;
     return _longtitude;
     } catch (e) {
       print(e);
     }
  }
}
