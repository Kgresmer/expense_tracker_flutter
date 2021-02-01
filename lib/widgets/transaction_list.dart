import 'package:expense_tracking_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transcation> _userTransactions;

  const TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 212,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  child: Text('\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _userTransactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                        DateFormat.yMEd().format(_userTransactions[index].date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ));
          },
          itemCount: _userTransactions.length,
        ));
  }
}
