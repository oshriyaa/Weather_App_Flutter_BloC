import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/model/weather.dart';

class FetchWeather {
  Future<Weather?> getWeather(String query) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?q=$query&key=4f155aedb1224a8491863814210109');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      var decoded = json.decode(response.body);
      var data = Weather.fromJson(decoded);
      print(data);
      return data;
    }
    print("API ERROR");
    return null;
  }

  
}
