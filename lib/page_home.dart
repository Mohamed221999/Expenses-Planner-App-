import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    //list of transaction
    Transaction(
        id: 't1', title: 'New Shose', amount: 79.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 55.25,
        date: DateTime.now()),
  ];
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
          //==========================Chart Part
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
          //==============================Transaction Part
          //i will convert the list of transaction to a list of widet (Mappin) by using .map method and .toList method
          Column(
            children: transaction.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: EdgeInsets.only(
                          left: 10, top: 15, bottom: 15, right: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 15,
                        ),
                        child: Center(
                          child: Text(
                            "\$" + e.amount.toString(),
                            style: TextStyle(color: Colors.pink, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        //using intl package to formate the date============
                        Text(
                          DateFormat.yMMMd().format(e.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
