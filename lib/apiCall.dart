import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

//import 'package:projectui/data.json';

Future<List<Transaction>> fetchData() async {
  var url = Uri.parse('https://dummyjson.com/quotes');

  var response = await http.get(url);
  var jsonData = json.decode(response.body);

  List<Transaction> transactions = [];

  jsonData.forEach((data) {
    Transaction transaction = Transaction.fromJson(data);
    transactions.add(transaction);
  });

  return transactions;
}
