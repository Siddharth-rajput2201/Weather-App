import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation()
  async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longititude);
  }

  void getData()
  async{
    Response response = await get("http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=cc07b30bfc796f97f8c6ceb318d38cf8");
    if(response.statusCode == 200)
      {
        String data = response.body;
        print(data);
      }
    else{
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
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
