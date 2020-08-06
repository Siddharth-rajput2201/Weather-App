import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart';

const apikey = 'cc07b30bfc796f97f8c6ceb318d38cf8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude ;
  double longitude ;


  void getLocation()
  async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longititude);
    latitude = location.latitude;
    longitude = location.longititude;
    getData();
  }

  void getData()
  async{
    Response response = await get("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey");
    if(response.statusCode == 200)
      {
        String data = response.body;
        print(data);
        var coordinatelong = jsonDecode(data)['coord']['lon'];
        var coordinatelat = jsonDecode(data)['coord']['lat'];
        var weatherdata = jsonDecode(data)['weather'][0]['description'];
        var temprature = jsonDecode(data)['main']['temp'];
        var cityname = jsonDecode(data)['name'];
        print(coordinatelong);
        print(coordinatelat);
        print(weatherdata);
        print(temprature);
        print(cityname);
      }
    else{
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
           // getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }


}
