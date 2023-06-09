import 'package:flutter/material.dart';
import 'package:projectui/screens/loading_screen.dart';
// ignore: depend_on_referenced_packages

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
