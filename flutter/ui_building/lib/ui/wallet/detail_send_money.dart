import 'package:flutter/material.dart';

class SendMoneyPage extends StatelessWidget {
  final amount;
  final date;
  final from;
  final to;
  final fromEmail;

  const SendMoneyPage({
    this.from,
    this.to,
    this.fromEmail,
    this.amount,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
    );
  }
}
