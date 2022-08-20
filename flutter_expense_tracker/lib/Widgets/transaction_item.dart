import "package:flutter/material.dart";
import 'dart:math';

import '../Models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    required Key key,
    required this.tran,
    required this.deleteTrans,
  }) : super(key: key);

  final Transaction tran;
  final Function deleteTrans;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor = Colors.lightGreen;

  @override
  void initState() {
    super.initState();
    const availbleColors = [
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.redAccent,
      Colors.grey
    ];

    _bgColor = availbleColors[Random().nextInt(availbleColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                style: TextStyle(color: Colors.black),
                'R ' + widget.tran.amount.toStringAsFixed(2),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tran.title.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(widget.tran.getForamtedDate()),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                onPressed: (() => widget.deleteTrans(widget.tran.id)),
                label: const Text("Delete"))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: (() => widget.deleteTrans(widget.tran.id)),
              ),
      ),
    );
  }
}
