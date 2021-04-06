import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];
  //================================add Transaction
  void _addNewTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: chosenDate);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  List<Transaction> get recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }
  //=================================delete Transaction

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id );
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
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransaction(context);
              }),
        ],
        title: Text('Personal Expenses'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //==============================Chart Part
        Container(
          width: double.infinity,
          child: Chart(recentTransaction: recentTransaction),
        ),
        TransactionList(
          transacton: _userTransaction,
          deleteTx: _deleteTransaction,
        ),
      ]),
    );
  }
}
