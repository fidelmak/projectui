import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import '../services/location.dart';

const apiKey = '21b79a9942618628f94873d4f7c15537';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    //LocationPermission permission = await Geolocator.requestPermission();
    Location getlocate = Location();
    await getlocate.getLocal();
    print(getlocate.latitude);
    print(getlocate.longitude);
  }

  void someThingLessthanTen(int n) {
    if (n > 10) {
      throw "error has occured";
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = "abs";
    double? mymarginDouble;

    try {
      mymarginDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(mymarginDouble ?? 30.0),
        color: Colors.green,
      ),
    );
  }
}
