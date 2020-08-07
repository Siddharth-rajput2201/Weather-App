import 'package:http/http.dart';
import 'dart:convert';

const apikey = 'cc07b30bfc796f97f8c6ceb318d38cf8';
class NetworkHelper{

  String url;

  NetworkHelper({this.url});


  Future getData()
  async{
    Response response = await get(url);
    if(response.statusCode == 200)
    {
      String data = response.body;
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }

}