import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  var url = Uri.parse(
      'https://646b7d727d3c1cae4ce3e29f.mockapi.io/api/vi/transactions');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request successful, parse the JSON response
    var jsonData = json.decode(response.body);
    // Process the data as needed
    print(jsonData);
  } else {
    // Request failed
    print('Request failed with status: ${response.statusCode}.');
  }
  fetchData();
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Apss'),
      ),
      body: Center(
        child: Text(
          'dummy text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
