import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projectui/screens/location_screen.dart';
//import 'package:geolocator/geolocator.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherData = await weathermodel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = "123";
    double? mymarginDouble;

    // try {
    //   mymarginDouble = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    // }

    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      ),
    ));
  }
}
