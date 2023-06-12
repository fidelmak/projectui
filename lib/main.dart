import 'package:flutter/material.dart';
import 'package:projectui/screens/loading_screen.dart';
// ignore: depend_on_referenced_packages

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          // Text color for app bar content
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white), // Headline text color
          bodyText2: TextStyle(color: Colors.white), // Body text color
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
