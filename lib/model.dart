class Transaction {
  final String name;

  Transaction({required this.name});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(name: json['name']);
  }
}
