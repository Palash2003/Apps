import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var url = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a143bdeadedc28a6fd5610554471e13d');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodedData = jsonDecode(data);

      var temperature = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
    } else {
      print(response.statusCode);
    }
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
