import 'package:flutter/material.dart';
import '../provider/modal.dart';

class ColorGridBar extends StatelessWidget {
  final Function onDoubleTap;
  final List<ColorCode> colorList;
  final Axis direction;
  const ColorGridBar(
      {Key key,
      @required this.colorList,
      @required this.onDoubleTap,
      this.direction = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 30,
        childAspectRatio: 1,
        // crossAxisSpacing: 1,
        // mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return _colorPattern(
            color: ProductItem.getProductColor(colorList[index]),
            callback: onDoubleTap);
      },
      itemCount: colorList.length,
      scrollDirection: direction,
      //    shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }

  Widget _colorPattern(
      {@required Map<String, Object> color, @required callback}) {
    return InkWell(
      onDoubleTap: () => callback,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color['color'],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
