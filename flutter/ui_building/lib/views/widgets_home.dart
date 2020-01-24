import 'package:flutter/material.dart';

class WidgetsHome extends StatelessWidget {
  const WidgetsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('❤️ Widgets'),
      ),
      backgroundColor: Colors.indigo.shade100,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Buttons လေးပါနော်",
                  style: TextStyle(
                    fontFamily: "MyanmarNayone",
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/button',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Alert Box ကဒီမှာ",
                  style: TextStyle(
                    fontFamily: "MyanmarNayone",
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/alert',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Radio Buttons ကဘယ်လို?",
                  style: TextStyle(
                    fontFamily: "MyanmarNayone",
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/radio',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Checkbox ကတော့",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "MyanmarNayone",
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/buttons',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "App Bar ဆိုတာ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "MyanmarNayone",
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/buttons',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Input အမျိုးမျိုး",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "MyanmarNayone",
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/buttons',
                ),
              ),
            ),
            Card(
              color: Colors.indigo.shade200,
              child: FlatButton(
                child: Text(
                  "Wallet Design Demo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/wallet',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
