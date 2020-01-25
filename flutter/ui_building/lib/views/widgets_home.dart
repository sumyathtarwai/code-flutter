import 'package:flutter/material.dart';

class WidgetsHome extends StatelessWidget {
  final routes = [
    {'title': 'Buttons လေးပါနော်', 'routeName': '/button'},
    {'title': 'Alert Box ကဒီမှာ', 'routeName': '/alert'},
    {'title': 'Radio Buttons ကဘယ်လို?', 'routeName': '/radio'},
    {'title': 'Checkbox ကတော့', 'routeName': '/checkbox'},
    {'title': 'Input အမျိုးမျိုး', 'routeName': '/input'},
    {'title': 'App Bar ဆိုတာ', 'routeName': '/appbar'},
    {'title': 'Wallet Design Demo', 'routeName': '/wallet'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('❤️ Widgets'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, i) {
            return buildRoute(
              context: context,
              title: routes[i]['title'],
              routeName: routes[i]['routeName'],
            );
          },
          itemCount: routes.length,
        ),
      ),
    );
  }

  Card buildRoute({BuildContext context, String title, String routeName}) {
    return Card(
      color: Colors.indigo.shade200,
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'MyanmarNayone',
            fontSize: 20.0,
          ),
        ),
        onPressed: () => Navigator.of(context).pushNamed(
          routeName,
        ),
      ),
    );
  }
}
