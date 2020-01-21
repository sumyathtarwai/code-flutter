import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction_model.dart';

class ExpensesInput extends StatefulWidget {
  final Function callBack;

  ExpensesInput({this.callBack});

  @override
  _ExpenseInputState createState() => _ExpenseInputState(callBack: callBack);
}

class _ExpenseInputState extends State<ExpensesInput> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();

  Function callBack;

  FocusNode _titleFocus;

  _ExpenseInputState({this.callBack});
  @override
  void initState() {
    _titleFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _titleCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[redraw] ExpensesInput');
    return Card(
      color: Colors.grey.shade100,
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_balance,
                ),
                labelText: 'What did you spend on?',
                labelStyle: TextStyle(
                  color: Colors.amber,
                  fontSize: 16.0,
                ),
                filled: true,
              ),
              controller: _titleCtrl,
              focusNode: _titleFocus,
            ),
            TextField(
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.attach_money,
                ),
                labelText: 'How much did you spend?',
                labelStyle: TextStyle(
                  color: Colors.amber,
                  fontSize: 16.0,
                ),
                filled: true,
              ),
              controller: _amountCtrl,
            ),
            const SizedBox(
              height: 10.0,
            ),
            OutlineButton(
              borderSide: BorderSide(
                color: Colors.amberAccent,
                width: 2.0,
              ),
              highlightColor: Colors.amber,
              highlightedBorderColor: Colors.white,
              child: Icon(Icons.save_alt),
              onPressed: () {
                print('[+] ${_amountCtrl.text} for ${_titleCtrl.text}');

                callBack(
                  Transaction(
                    id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
                    title: _titleCtrl.text,
                    amount: double.tryParse(_amountCtrl.text) ?? 0.0,
                    date: DateTime.now(),
                  ),
                );
                _titleCtrl.clear();
                _amountCtrl.clear();
                FocusScope.of(context).requestFocus(_titleFocus);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class ExpensesInput extends StatelessWidget {
//   final TextEditingController _titleCtrl = TextEditingController();
//   final TextEditingController _amountCtrl = TextEditingController();
//   final Function callBack;

//   ExpensesInput({this.callBack});

//   @override
//   Widget build(BuildContext context) {
//     print('[redraw] ExpensesInput');
//     return Card(
//       color: Colors.grey.shade100,
//       elevation: 5.0,
//       child: Container(
//         padding: EdgeInsets.all(
//           10.0,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             TextField(
//               cursorColor: Colors.amber,
//               decoration: InputDecoration(
//                 icon: Icon(
//                   Icons.account_balance,
//                 ),
//                 labelText: 'What did you spend on?',
//                 labelStyle: TextStyle(
//                   color: Colors.amber,
//                   fontSize: 16.0,
//                 ),
//                 filled: true,
//               ),
//               controller: _titleCtrl,
//             ),
//             TextField(
//               cursorColor: Colors.amber,
//               decoration: InputDecoration(
//                 icon: Icon(
//                   Icons.attach_money,
//                 ),
//                 labelText: 'How much did you spend?',
//                 labelStyle: TextStyle(
//                   color: Colors.amber,
//                   fontSize: 16.0,
//                 ),
//                 filled: true,
//               ),
//               controller: _amountCtrl,
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             OutlineButton(
//               borderSide: BorderSide(
//                 color: Colors.amberAccent,
//                 width: 2.0,
//               ),
//               highlightColor: Colors.amber,
//               highlightedBorderColor: Colors.white,
//               child: Icon(Icons.save_alt),
//               onPressed: () {
//                 print('[+] ${_amountCtrl.text} for ${_titleCtrl.text}');

//                 callBack(
//                   Transaction(
//                     id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
//                     title: _titleCtrl.text,
//                     amount: double.tryParse(_amountCtrl.text) ?? 0.0,
//                     date: DateTime.now(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
