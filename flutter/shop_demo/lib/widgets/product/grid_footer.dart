import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Widget leading;
  final Widget middle;
  final Widget trailing;

  const Footer({
    Key key,
    @required this.leading,
    @required this.middle,
    @required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            leading,
            middle,
            trailing,
          ],
        ),
      ),
    );
  }
}
