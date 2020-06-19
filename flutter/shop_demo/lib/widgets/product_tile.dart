import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_demo/widgets/grid_footer.dart';
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
            child: imageSection(product.imageUrl),
          ),
          Expanded(
            flex: 2,
            child: description(context, product.desc),
          ),

          if (product.color == ColorCode.non)
            Expanded(
              flex: 0,
              child: noSize(),
            ),
          //TODO color list row
          if (product.color != ColorCode.non)
            Expanded(
              flex: 0,
              child: colorPattern(color: product.productColor),
            ),
          Expanded(
            child: sizeTag(context: context, size: product.sizeName),
          ),
          Expanded(
            flex: 2,
            child: GridFooter(
              leading: priceTag(context, product.price),
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

  Widget description(BuildContext context, String desc) {
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

  Widget noSize() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: 20,
      height: 20,
      child: Icon(
        Icons.close,
        color: Colors.red,
        size: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget priceTag(BuildContext context, double price) {
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

  Widget sizeTag({@required BuildContext context, @required String size}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        size == 'Non' ? '' : size,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.black45),
      ),
    );
  }

  Widget colorPattern({@required Map<String, Object> color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color['color'],
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget imageSection(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5),
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: image,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              color: Colors.black,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
