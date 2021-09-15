import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 'trx1', title: 'Shoes', amount: 69.9, date: DateTime.now()
    ),
    Transaction(
        id: 'trx2', title: 'Chair', amount: 199.9, date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            child: Container(width: double.infinity, child: Text('Chart')),
            elevation: 5,
          ),
          Column(
            children: transactions.map((tx) => Card(
                child: Text(tx.title),
            )).toList(),
          )
        ],
      ),
    );
  }
}
