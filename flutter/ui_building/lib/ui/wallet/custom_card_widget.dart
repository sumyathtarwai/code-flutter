import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final indicator;
  final title;
  final subTitle;
  final link;

  const CustomCard({this.indicator, this.title, this.subTitle, this.link});

  @override
  Widget build(BuildContext context) {
    final indicatorCircle = Container(
      width: 100.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.teal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          indicator,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );

    const divider = Divider(
      indent: 20.0,
      endIndent: 20.0,
      thickness: 2.0,
    );

    var titleText = Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );

    var subTitleText = Text(
      subTitle,
      style: TextStyle(
        color: Colors.grey,
      ),
    );

    var statisticText = Text(
      link,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
    return Container(
      // card size
      width: 380.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black12,
            offset: Offset(
              3.0,
              3.0,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                indicatorCircle,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    titleText,
                    subTitleText,
                  ],
                )
              ],
            ),
          ),
          divider,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                statisticText,
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
