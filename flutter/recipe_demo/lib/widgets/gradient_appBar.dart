import 'package:flutter/material.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final TextStyle textStyle;
  final String title;
  const GradientAppBar({Key key, this.height, this.textStyle, this.title})
      : super(key: key);

  @override
  _GradientAppBarState createState() => _GradientAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56.0);
}

class _GradientAppBarState extends State<GradientAppBar> {
  @override
  Widget build(BuildContext context) {
    // final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    // final bool canPop = parentRoute?.canPop ?? false;

    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: widget.textStyle,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark,
              ],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.2, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}
