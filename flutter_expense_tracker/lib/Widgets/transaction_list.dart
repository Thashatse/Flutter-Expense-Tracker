import "package:flutter/material.dart";

import '../Models/transaction.dart';
import '../Widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _trans;
  final Function deleteTrans;

  TransactionList(this._trans, this.deleteTrans) {
    print('constructor TransactionList');
  }

  @override
  Widget build(BuildContext context) {
    print('build Transaction_list');
    return _trans.isEmpty
        ? LayoutBuilder(builder: ((ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'No Transactions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }))
        : ListView(
            children: _trans
                .map((tran) => TransactionItem(
                      key: ValueKey(tran.id),
                      tran: tran,
                      deleteTrans: deleteTrans,
                    ))
                .toList(),
          );
  }
}
