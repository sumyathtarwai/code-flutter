import 'package:flutter/material.dart';
import 'package:ui_building/buttons/buttons.dart';
import 'package:ui_building/ui/wallet/wallet_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Wallet page

    // return MaterialApp(
    //   theme: ThemeData(
    //     primaryColor: Colors.teal.shade700,
    //   ),
    //   home: WalletHome(),
    // );

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => _UIHome(),
        '/buttons': (context) => ButtonHome(),
        '/wallet': (context) => WalletHome(),
      },
    );
  }
}

class _UIHome extends StatelessWidget {
  const _UIHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
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
                  "Buttons လေးတွေပါ",
                  style: TextStyle(
                    fontFamily: "MyanmarNayone",
                    fontSize: 20.0,
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
                  "Alert Box",
                  style: TextStyle(
                    fontSize: 20.0,
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
                  "Radio Buttons",
                  style: TextStyle(
                    fontSize: 20.0,
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
                  "Checkbox",
                  style: TextStyle(
                    fontSize: 20.0,
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
                  "App Bar",
                  style: TextStyle(
                    fontSize: 20.0,
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
                  "Input",
                  style: TextStyle(
                    fontSize: 20.0,
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
