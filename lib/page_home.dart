import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import './models/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  //================================add Transaction
  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

//====================================show transaction sheet
  void _startAddNewTransaction(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(
            addTx: _addNewTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            _startAddNewTransaction(context);
          }),
        ],
        title: Text('Personal Expenses'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //==============================Chart Part
        Container(
          width: double.infinity,
          child: Card(
            child: Text('Chart'),
            elevation: 5,
          ),
        ),
        TransactionList(
          transacton: _userTransaction,
        ),
      ]),
    );
  }
}
