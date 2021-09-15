import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'trx1', title: 'Shoes', amount: 16.09, date: DateTime.now()
    ),
    Transaction(
        id: 'trx2', title: 'Chair', amount: 19.92, date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          _addNewTransaction
        ),
        TransactionList(
            _userTransactions
        )
      ],
    );
  }

  void _addNewTransaction(String title, double amount) {
    final newTrx = Transaction(id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()
    );
    setState(() {
      _userTransactions.add(newTrx);
    });
  }

}
