import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';
class MyHomePage extends StatelessWidget {

  

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
          UserTransaction(),
         ] 
         ),   
    );
  }
}
