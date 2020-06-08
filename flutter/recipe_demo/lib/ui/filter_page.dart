import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          child: Text('Filter'),
        ),
      ),
    );
  }
}
