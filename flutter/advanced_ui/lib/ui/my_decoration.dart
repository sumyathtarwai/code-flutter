import 'package:flutter/material.dart';

class MyDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoration'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                //shape: BoxShape.circle,
                color: Colors.amber,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    5.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                  bottomLeft: Radius.circular(
                    30.0,
                  ),
                  bottomRight: Radius.circular(
                    0.0,
                  ),
                  // 0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
