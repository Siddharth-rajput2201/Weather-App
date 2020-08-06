import 'package:geolocator/geolocator.dart';


class Location
{
  double latitude;
  double longititude;

  Future<void> getCurrentLocation()
  async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longititude = position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }
}