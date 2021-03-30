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
      child: transacton.isEmpty? Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container( 
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                //decrease opacity================================================================
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstOut),
                image: AssetImage("assets/images/empty.png"),
                fit: BoxFit.fill,
              ),
            ),
            ),
          Text("No transaction added yet!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          ),
        ],
      ): ListView.builder(
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
                      BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 15,
                    ),
                    child: Center(
                      child: Text(
                        "\$" + transacton[index].amount.toStringAsFixed(2),
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17,fontWeight: FontWeight.bold),
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
