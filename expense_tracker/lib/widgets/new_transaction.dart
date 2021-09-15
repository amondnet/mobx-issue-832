import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTrx;

  NewTransaction(this.addTrx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(onPressed: () {
              addTrx(
                  titleController.text,
                  double.parse(amountController.text)
              );
            }, child: Text('Add Transaction'),)
          ],
        ),
      ),
    );
  }
}
