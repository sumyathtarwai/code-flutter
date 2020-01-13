import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final title;
  final balance;
  final balancePercent;

  const BottomWidget({this.title, this.balance, this.balancePercent = '0%'});

  @override
  Widget build(BuildContext context) {
    final yourWalletText = Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
    final balanceText = Text(
      balance,
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
      ),
    );
    final balanceUpText = Text(
      balancePercent,
      style: TextStyle(
        color: Colors.white,
      ),
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: yourWalletText,
          ),
          Row(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 20.0,
                ),
                child: balanceText,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                width: 65.0,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                    balanceUpText,
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
