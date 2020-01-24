import 'dart:math';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final percent;
  final title;
  final subTitle;
  final link;

  const CustomCard({this.percent, this.title, this.subTitle, this.link});

  @override
  Widget build(BuildContext context) {
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
                // indicatorCircle,
                Container(
                  width: 110.0,
                  height: 65.0,
                  child: CustomPaint(
                    foregroundPainter: _IndicatorPainter(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.deepOrange.shade400,
                      percent: percent,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xFF416D6C,
                        ),
                      ),
                      child: Text(
                        '$percent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    titleText,
                    subTitleText,
                  ],
                ),
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

class _IndicatorPainter extends CustomPainter {
  var percent;
  var backgroundColor;
  var foregroundColor;

  _IndicatorPainter({this.percent, this.foregroundColor, this.backgroundColor});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width / 2, size.height / 2);

    // dreaw circle
    canvas.drawCircle(center, radius, paint);

    var arcPaint = Paint();
    arcPaint.color = foregroundColor;
    arcPaint.style = PaintingStyle.stroke;
    arcPaint.strokeCap = StrokeCap.square;
    arcPaint.strokeWidth = 2.5;

// 2 * pi -> complete unit of circle
    var sweepAngle = 2 * pi * (percent / 100);
    // (percent / 100);
    canvas.drawArc(
        Rect.fromCenter(
          center: center,
          width: min(size.width, size.height),
          height: min(size.width, size.height),
        ),
        -pi / 2,
        sweepAngle,
        false,
        arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
