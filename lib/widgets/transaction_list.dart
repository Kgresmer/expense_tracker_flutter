import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  const TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: _userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Nothing here yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                    height: 200,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        child: Text(
                            '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _userTransactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                              DateFormat.yMEd()
                                  .format(_userTransactions[index].date),
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
