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
    var amountText = Text(
      amount,
      style: TextStyle(
        fontSize: 28.0,
        letterSpacing: 1.0,
        color: Colors.teal.shade700,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        elevation: 0.0,
      ),
      backgroundColor: Colors.teal.shade700,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 60.0,
          horizontal: 20.0,
        ),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildSendMoneyIcon(
                Icons.check_circle,
              ),
              Padding(
                padding: EdgeInsets.all(
                  20.0,
                ),
                child: twoLineText('Send successfully to ', to),
              ),
              amountText,
              buildUserInfo(
                'assets/avatar.png',
                from,
                fromEmail,
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                ),
                child: twoLineText('Transaction done on ', '12 Junary 2020.'),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('Your reference number is 1234567890'),
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: buildButton('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserInfo(String imgPath, String name, String email) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.blueGrey.shade700,
          radius: 30.0,
          backgroundImage: AssetImage(imgPath),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 35.0,
            horizontal: 14.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton(String btnName) {
    return Container(
      width: 200.0,
      height: 40.0,
      child: Center(
        child: FlatButton(
          child: Text(
            btnName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          onPressed: () => print('btnName'),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        gradient: LinearGradient(
          colors: [
            Colors.teal,
            Colors.teal.shade100,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black12,
            offset: Offset(
              2.0,
              2.0,
            ),
          )
        ],
      ),
    );
  }

  Widget twoLineText(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          text1,
        ),
        Text(
          text2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildSendMoneyIcon(IconData iconCondition) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Container(
          width: 140.0,
          height: 100.0,
          margin: EdgeInsets.only(
            top: 60.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepOrange.shade50,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(
              Icons.input,
              color: Colors.orangeAccent,
              size: 38.0,
            ),
          ),
        ),
        Positioned(
          left: 100.0,
          bottom: 5.0,
          child: Icon(
            iconCondition,
            size: 26.0,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}
