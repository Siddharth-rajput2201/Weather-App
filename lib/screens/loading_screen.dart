import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude ;
  double longitude ;


  void getLocationData()
  async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longititude);
    NetworkHelper networkHelper = NetworkHelper(url : "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longititude}&appid=$apikey&units=metric");

    var weatherData = await networkHelper.getData();
    //print(weatherData);
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {return LocationScreen(locationWeather: weatherData,);}));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 70,
      ),
      ),
    );
  }


}

