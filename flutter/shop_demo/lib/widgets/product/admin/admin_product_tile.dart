import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/widgets/common/common_part_export.dart';
import '../../../provider/modal.dart';
import 'product_update.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductItem>(context);
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(product.desc),
          Text('Price: \$${product.price}'),
        ],
      ),
      trailing: Row(
        // fix 'hasSize' by setting min
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => showFloatingModalBottomSheet(
              context: context,
              builder: (context, scrollController) => ProductUpdate(
                scrollController: scrollController,
                product: product,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              var productOf = Provider.of<ProductList>(context, listen: false);
              var removeProduct = productOf.removeProduct(product.id);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Successfully Deleted!'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () => productOf.undoRemove(removeProduct),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
