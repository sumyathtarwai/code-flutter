import 'package:flutter/material.dart';

import 'detail_send_money.dart';

class DetailSummaryPage extends StatelessWidget {
  final sendAmount;
  final payAmount;
  final topUpAmount;
  final requestAmount;

  const DetailSummaryPage({
    this.sendAmount = '\$0.0',
    this.payAmount = '\$0.0',
    this.topUpAmount = '\$0.0',
    this.requestAmount = '\$0.0',
  });

  @override
  Widget build(BuildContext context) {
    var detailText = Text(
      'Detail Information',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade700,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: detailText,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: buildCard(
                Icons.input,
                'Send Money',
                sendAmount,
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendMoneyPage(
                        from: 'John Doe ',
                        fromEmail: 'unknown@gmail.com',
                        to: 'Lela Crawford',
                        amount: sendAmount,
                      ),
                    ),
                  )
                },
                circleColor: Colors.deepOrange.shade50,
                iconColor: Colors.orangeAccent,
              ),
            ),
            Expanded(
              child: buildCard(
                Icons.payment,
                'Pay Items',
                payAmount,
                () => print('object2'),
                circleColor: Colors.teal.shade50,
                iconColor: Colors.teal,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: buildCard(
                Icons.system_update_alt,
                'Top Up',
                topUpAmount,
                () => print('object3'),
                circleColor: Colors.pink.shade50,
                iconColor: Colors.pink.shade400,
              ),
            ),
            Expanded(
              child: buildCard(
                Icons.receipt,
                'Request Money',
                payAmount,
                () => print('object4'),
                circleColor: Colors.purple.shade50,
                iconColor: Colors.purpleAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCard(IconData icon, String title, amount, Function function,
      {Color iconColor, Color circleColor = Colors.orangeAccent}) {
    final iconCircle = Container(
      width: 100.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Icon(
          icon,
          color: iconColor,
          size: 28.0,
        ),
      ),
    );
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      elevation: 2.0,
      child: Container(
        width: 180.0,
        height: 175.0,
        child: FlatButton(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              iconCircle,
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onPressed: function,
        ),
      ),
    );
  }
}
