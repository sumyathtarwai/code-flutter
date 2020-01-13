import 'package:flutter/material.dart';

class DetailSummaryPage extends StatelessWidget {
  final sendAmount;
  final payAmount;
  final topUpAmount;
  final requestAmount;

  const DetailSummaryPage({
    this.sendAmount,
    this.payAmount,
    this.topUpAmount,
    this.requestAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Detail Information'),
        Card(
          child: Container(
            child: FlatButton(
              child: Text(
                sendAmount,
              ),
              onPressed: () => print('object'),
            ),
          ),
        )
      ],
    );
  }
}
