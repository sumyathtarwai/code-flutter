import 'package:flutter/material.dart';
import 'package:shop_demo/widgets/color_non.widget.dart';
import '../widgets/color_grid_widget.dart';
import '../widgets/grid_footer.dart';
import '../widgets/grid_image.dart';
import '../modal/modal.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: GridBarImage(imagePath: product.imageUrl),
          ),
          Expanded(
            child: _description(context, product.title),
          ),
          if (product.color == null || product.color?.first == ColorCode.non)
            Expanded(
              child: ColorNonIcon(),
            ),

          if (product.color != null && product.color?.first != ColorCode.non)
            Expanded(
              child: ColorGridBar(colorList: product.color),
            ),
          //TODO size list row
          Expanded(
            child: _sizeTag(context: context, size: product.sizeName),
          ),
          Expanded(
            flex: 2,
            child: Footer(
              leading: _priceTag(context, product.price),
              middle: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () => {},
              ),
              trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart), onPressed: () => {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _priceTag(BuildContext context, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: FittedBox(
        child: Text(
          '\$ $price',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _sizeTag({@required BuildContext context, @required String size}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        size == 'Non' ? '' : size,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: Colors.black45),
      ),
    );
  }
}
