import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function addTransaction;

  InputTransaction(this.addTransaction);

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.textsms),
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                controller: _titleCtrl,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Title!';
                  }
                  return null;
                },
                // onChanged: (val) => null,
              ),
              padding: EdgeInsets.all(5),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                controller: _amountCtrl,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value.isEmpty || double.parse(value) <= 0) {
                    return 'Please enter amount';
                  }
                  return null;
                  // android => TextInputType.number,
                  // onChanged: (val) => null,
                },
              ),
              padding: EdgeInsets.all(5),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _date == null
                        ? 'No date is selected yet!'
                        : 'Selected: ${DateFormat.yMEd().format(_date)}',
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: _showDate,
                  child: Text('SELECT DATE'),
                )
              ],
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('SAVE'),
              onPressed: () {
                if (_formKey.currentState.validate() && _date != null) {
                  // hide keyboard
                  FocusScope.of(context).unfocus();
                  // hide modal
                  Navigator.of(context).pop();
                  // change state
                  //access statefull widget vai widget prop
                  widget.addTransaction(
                    _titleCtrl.text,
                    double.parse(_amountCtrl.text),
                    _date,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDate() {
    FocusScope.of(context).unfocus();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        setState(
          () {
            _date = value;
          },
        );
      },
    );
  }
}
