

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weather_app/model/weather.dart';

class StyleText {
  static const style1 =
      TextStyle(fontSize: 18, height: 1, fontFamily: 'FairDisplay');
  static const style2 =
      TextStyle(fontSize: 25, height: 2, fontFamily: 'FairDisplay');
}

class WeatherInfo extends StatelessWidget {
  final Weather weatherInfo;

  const WeatherInfo({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "  ${weatherInfo.location?.name}",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FairDisplay'),
                  ),
                  Text("${weatherInfo.location?.country}",
                      style: StyleText.style1)
                ],
              ),
              Container(
                child: Image.network(
                  "http:${weatherInfo.current?.condition?.icon}",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "${weatherInfo.current?.feelslikeC} °C",
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FairDisplay'),
                    ),
                    Text(
                      "${weatherInfo.current?.tempC} °C/ ${weatherInfo.current?.tempF} °F",
                      style: StyleText.style2,
                    ),
                    Text(
                      "${weatherInfo.current?.condition?.text}",
                      style: StyleText.style1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FairDisplay'),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                      indent: 60,
                      endIndent: 60,
                    ),
                    Text(
                      "Humidity: ${weatherInfo.current?.humidity}",
                      style: StyleText.style1,
                    ),
                    Text(
                      "Clouds: ${weatherInfo.current?.cloud}",
                      style: StyleText.style1,
                    ),
                    Text(
                      "Wind: ${weatherInfo.current?.windKph} kph",
                      style: StyleText.style1,
                    ),
                    Text(
                      "Wind Direction: ${weatherInfo.current?.windDir}",
                      style: StyleText.style1,
                    ),
                    Text(
                      "Wind Degree: ${weatherInfo.current?.windDegree}",
                      style: StyleText.style1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last updated: ${weatherInfo.current?.lastUpdated}",
                      style: StyleText.style1,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
