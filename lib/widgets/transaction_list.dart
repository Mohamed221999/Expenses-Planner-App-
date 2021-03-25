import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacton;

  TransactionList({this.transacton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: transacton.length,
        itemBuilder: (context, index) {
        //==============================Transaction Part
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
                        "\$" + transacton[index].amount.toStringAsFixed(2),
                        style: TextStyle(color: Colors.pink, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transacton[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    //using intl package to formate the date============
                    Text(
                      DateFormat.yMMMd().format(transacton[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        ),
    );
  }
}
