import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projectui/screens/location_screen.dart';
//import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'export.dart';

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
    double latitude;
    double longitude;
    //LocationPermission permission = await Geolocator.requestPermission();
    Location getlocate = Location();
    await getlocate.getLocal();
    latitude = getlocate.latitude;
    longitude = getlocate.longitude;

    Networkhelper networkhelper = Networkhelper(urlData);

    var weatherData = await networkhelper.getData();
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
