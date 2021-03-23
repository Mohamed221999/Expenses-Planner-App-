import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';

class MyHomePage extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //==============================Chart Part
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          //========================Input Area
          Card(
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
                ],
              ),
            ),
          ),
          TransactionList(),
         ] 
         ),   
    );
  }
}
