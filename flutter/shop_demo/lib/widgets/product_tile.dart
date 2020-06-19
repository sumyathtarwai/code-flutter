import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../modal/modal.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: product.imageUrl,
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
          ),
          Text(
            product.desc,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          //TODO color list row
          if (product.color == ColorCode.non)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: 20,
              height: 20,
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
            ),
          if (product.color != ColorCode.non)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: 20,
              height: 20,
              color: product.productColor['color'],
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              product.size == Size.non ? '' : product.sizeName,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black45),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '\$ ${product.price}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
