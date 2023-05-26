import 'package:flutter/material.dart';

import 'apiCall.dart';
import 'model.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Transaction> transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              Transaction transaction = transactions[index];
              return ExpansionTile(
                title: Text(transaction.name),
                children: [
                  // Add any additional content you want to display
                ],
              );
            },
          );
        }
      },
    );
  }
}
