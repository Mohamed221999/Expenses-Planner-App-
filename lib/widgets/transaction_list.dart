import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransaction = [
    //list of transaction
    Transaction(
        id: 't1', title: 'New Shose', amount: 79.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 55.25,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      //==============================Transaction Part
      //i will convert the list of transaction to a list of widet (Mappin) by using .map method and .toList method
      children: _userTransaction.map((e) {
        return Card(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                margin:
                    EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
    );
  }
}
