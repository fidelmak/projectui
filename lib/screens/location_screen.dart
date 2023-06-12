import 'package:flutter/material.dart';
import 'package:projectui/screens/city_screen.dart';

import '../services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherupdate;
  late String cityName;
  late String weatherMessg;
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherupdate = "empty";
      weatherMessg = "unable to get weather data ";
      cityName = "";
      return;
    }
    double temp = weatherData["main"]["temp"];
    temperature = temp.toInt();
    var condition = weatherData["weather"][0]["id"];
    weatherupdate = weather.getWeatherIcon(condition);
    weatherMessg = weather.getMessage(temperature);
    cityName = weatherData["name"];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                      print("did't return");
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.red,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature}',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${weatherupdate}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherMessg} in ${cityName}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
