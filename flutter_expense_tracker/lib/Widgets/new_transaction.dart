import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function OnAddTransaction;

  NewTransaction(@required this.OnAddTransaction) {
    print('constructor NewTransaction');
  }

  @override
  State<NewTransaction> createState() {
    print('NewTransaction createState');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  //String titleInput = "";
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('constructor _NewTransactionState');
  }

  @override
  void initState() {
    super.initState();
    print('initState NewTransactionState');
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_NewTransactionState didUpdateWidget()');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('_NewTransactionState dispose()');
  }

  void _Submit() {
    final titleText = _titleControler.text;
    final amaountText = _amountControler.text;

    if (amaountText.isEmpty) return;

    final amountValue = double.parse(amaountText);

    if (titleText.isEmpty || amountValue <= 0 || _selectedDate == null) return;

    widget.OnAddTransaction(titleText, amountValue, _selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build new_transaction');
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
              bottom: MediaQuery.of(context).viewInsets.bottom + 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleControler,
                onSubmitted: (_) => _Submit(),
                //                      onChanged: (val) {
                //                        titleInput = val;
                //                      },
                autocorrect: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: _amountControler,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _Submit(),
                //                      onChanged: (val) {
                //                        titleInput = val;
                //                      },
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    // ignore: unnecessary_null_comparison
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Transaction Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                  onPressed: _Submit,
                  child: Text("Add Transaction"),
                  color: Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
