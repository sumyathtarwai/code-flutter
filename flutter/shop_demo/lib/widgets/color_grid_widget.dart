import 'package:flutter/material.dart';
import '../modal/modal.dart';

class ColorGridBar extends StatelessWidget {
  final List<ColorCode> colorList;
  const ColorGridBar({Key key, this.colorList}) : super(key: key);

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
          color: Product.getProductColor(colorList[index]),
        );
      },
      itemCount: colorList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }

  Widget _colorPattern({@required Map<String, Object> color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color['color'],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
