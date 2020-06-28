import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/modal.dart';

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
          IconButton(icon: Icon(Icons.edit), onPressed: () => {}),
          IconButton(icon: Icon(Icons.delete), onPressed: () => {})
        ],
      ),
    );
  }
}
