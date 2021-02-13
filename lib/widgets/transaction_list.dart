import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function deleteTransaction;

  const TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _userTransactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
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
                      height: constraints.maxHeight * 0.6,
                    )
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                    '\$${_userTransactions[index].amount}'),
                              ))),
                      title: Text(
                        _userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(_userTransactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            deleteTransaction(_userTransactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: _userTransactions.length,
              ));
  }
}
