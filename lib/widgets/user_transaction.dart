import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import './transaction_list.dart';
import 'package:personal_expenses/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //========================Input Area
        NewTransaction(addTx: _addNewTransaction,),
        //=========================Transactions Area
        TransactionList(
          transacton: _userTransaction,
        ),
      ],
    );
  }
}
