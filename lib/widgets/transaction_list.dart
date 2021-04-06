import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacton;
  final Function deleteTx;

  TransactionList({this.transacton, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
       
        child: transacton.isEmpty
            ? Column(
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
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstOut),
                        image: AssetImage("assets/images/empty.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "No transaction added yet!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transacton.length,
                itemBuilder: (context, index) {
                  //==============================Transaction Part
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: FittedBox(
                        child: CircleAvatar(
                          radius: 30,
                          child:
                              Text('\$' + transacton[index].amount.toString()),
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd()
                            .format(transacton[index].date)
                            .toString(),
                      ),
                      title: Text(
                        transacton[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTx(transacton[index].id);
                        },
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
