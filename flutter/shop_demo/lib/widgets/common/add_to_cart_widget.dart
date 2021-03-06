import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/modal.dart';

class AddToCartButton extends StatelessWidget {
  final ProductItem product;

  const AddToCartButton({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartList>(context, listen: false);
    return RaisedButton(
      child: Text(
        'Add To Cart',
        style: Theme.of(context).textTheme.button,
      ),
      onPressed: () {
        cart.addToCart(
          CartItem(
              id: DateTime.now().toString(),
              productId: product.id,
              title: product.title,
              price: product.price,
              // FIXME Color and qty
              color: ColorCode.red,
              qty: 1),
        );
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            content: Text(
              'Successfully Added to Cart!',
            ),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => cart.removeCurrent(product.id),
            ),
          ),
        );
      },
    );
  }
}
