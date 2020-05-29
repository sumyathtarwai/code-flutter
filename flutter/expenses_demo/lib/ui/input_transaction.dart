import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 0,
        child: Container(
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
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text('Add'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // hide keyboard
                    FocusScope.of(context).unfocus();
                    // hide modal
                    Navigator.of(context).pop();
                    // change state
                    //access statefull widget vai widget prop
                    widget.addTransaction(
                      _titleCtrl.text,
                      double.parse(_amountCtrl.text),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
