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
    return Container(
      height: 500,
      width: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //  width: 500,
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
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _date == null
                        ? 'No date is selected yet!'
                        : 'Selected: ${DateFormat.yMEd().format(_date)}',
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    onPressed: _showDate,
                    child: Text('SELECT DATE'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDate() {
    // hide keyboard if opened
    FocusScope.of(context).unfocus();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // allowale past date
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
