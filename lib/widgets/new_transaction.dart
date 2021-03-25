import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction({this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submittedData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    //==============check two text fields if there is invalide one i will return noting
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    //==============add a new transaction
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              //fetch input from titleText
              controller: titleController,
              onSubmitted: (_) => submittedData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Amount"),
              //fetch input from amounText
              controller: amountController,
              onSubmitted: (_) => submittedData(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextButton(
              onPressed: submittedData,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Add Transaction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
