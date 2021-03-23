import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction({this.addTx});
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
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              //fetch input from amounText
              controller: amountController,
            ),
            FloatingActionButton(onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            }
            ),
          ],
        ),
      ),
    );
  }
}
