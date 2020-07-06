import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/modal.dart';

class ProductEditForm extends StatefulWidget {
  final Function loadingCallback;
  const ProductEditForm({
    Key key,
    @required this.product,
    @required this.loadingCallback,
  }) : super(key: key);

  final ProductItem product;

  @override
  _ProductEditFormState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends State<ProductEditForm> {
  ProductItem _newProduct;
  TextEditingController _imageCtrl;
  final _formKey = GlobalKey<FormState>();
  final _descFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();

  //Color _currentColor = Colors.limeAccent;
  // void _changeColor(Color color) => setState(() => _currentColor = color);

  @override
  void initState() {
    super.initState();
    _imageCtrl = TextEditingController(text: widget.product?.imageUrl);
    _imageFocusNode.addListener(_updatePreviewImage);

    //
    var existingProduct = widget.product;
    if (existingProduct != null) {
      _newProduct = widget.product;
    } else {
      _newProduct = ProductItem(
        id: null,
        title: null,
        desc: null,
        price: null,
        imageUrl: null,
        displayQty: 10,
        size: Size.free,
        color: [ColorCode.white],
        isFavorite: false,
      );
    }
  }

  @override
  void dispose() {
    _imageCtrl.dispose();

    _descFocusNode.dispose();
    _imageFocusNode.removeListener(_updatePreviewImage);
    _imageFocusNode.dispose();
    super.dispose();
  }

  void _updatePreviewImage() {
    if (!_imageFocusNode.hasFocus) {
      setState(() => {});
    }
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState.validate()) {
      final existingProduct = widget.product;
      var isEdit = existingProduct?.id != null;

      try {
        _formKey.currentState.save();
        var productOf = Provider.of<ProductList>(context, listen: false);
        widget.loadingCallback(loading: true);
        if (isEdit) {
          // TODO as color unchangeable always update as is
          await productOf.updateProduct(_newProduct);
        } else {
          await productOf.addProduct(_newProduct);
        }

        widget.loadingCallback(loading: false, pop: true);
      } catch (e) {
        widget.loadingCallback(loading: false, pop: false);
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     content: Text('Something went wrong'),
        //     actions: <Widget>[
        //       FlatButton(
        //         onPressed: () => Navigator.of(context).popUntil(
        //           ModalRoute.withName(RouteName.adminProduct),
        //         ),
        //         child: Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
      }
    }
  }

  ProductItem _copyProductWith({
    String id,
    String title,
    String desc,
    double price,
    String imageUrl,
    Size size,
    List<ColorCode> color,
    int displayQty,
    bool isFavorite,
  }) {
    return ProductItem(
      id: _newProduct.id,
      title: title ?? _newProduct.title,
      desc: desc ?? _newProduct.desc,
      price: price ?? _newProduct.price,
      imageUrl: imageUrl ?? _newProduct.imageUrl,
      size: size ?? _newProduct.size,
      color: color ?? _newProduct.color,
      displayQty: displayQty ?? _newProduct.displayQty,
      isFavorite: _newProduct.isFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    var textOf = Theme.of(context).textTheme;
    var product = widget.product;
    var _isEdit = product != null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                // controller: _titleCtrl,
                initialValue: product?.title,
                validator: (value) {
                  return value.isEmpty ? 'Please enter tilte.' : null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_descFocusNode),
                onSaved: (newValue) =>
                    _newProduct = _copyProductWith(title: newValue.trim()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                // controller: _descCtrl,
                initialValue: product?.desc,
                validator: (value) =>
                    value.isEmpty ? 'Please enter description.' : null,
                focusNode: _descFocusNode,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (newValue) =>
                    _newProduct = _copyProductWith(desc: newValue.trim()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                // controller: _descCtrl,
                initialValue: product?.price?.toString(),
                onSaved: (newValue) {
                  var val = newValue.trim();
                  if (val.endsWith('.')) {
                    val = val.replaceFirst(RegExp(r'.'), '');
                  }
                  _newProduct = _copyProductWith(price: double.parse(val));
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid price.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Minium price must be greater than zero.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Qty',
                  border: OutlineInputBorder(),
                ),
                initialValue: '10',
                textInputAction: TextInputAction.next,
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Size',
                  border: OutlineInputBorder(),
                ),
                initialValue: 'Free',
                textInputAction: TextInputAction.next,
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Color',
                  border: OutlineInputBorder(),
                ),
                //FIXME always Non
                initialValue: 'Non',
                textInputAction: TextInputAction.next,
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: _imageCtrl.text.isEmpty
                          ? Center(
                              child: Text(
                                'Preview Image',
                                style: textOf.caption,
                              ),
                            )
                          // ONLY image stream will WORK
                          : FittedBox(
                              child: Image.network(_imageCtrl.text),
                              fit: BoxFit.cover,
                            ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      // height: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Image URL',
                          border: OutlineInputBorder(),
                        ),
                        controller: _imageCtrl,
                        validator: (value) => value.isEmpty
                            ? 'Please enter URL'
                            : !value.startsWith(RegExp('(https|http)'))
                                ? 'Please enter valid URL'
                                : null,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        focusNode: _imageFocusNode,
                        onSaved: (newValue) => _newProduct =
                            _copyProductWith(imageUrl: newValue.trim()),
                        onFieldSubmitted: (_) async => await _saveForm(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                onPressed: () async {
                  await _saveForm();
                },
                icon: Icon(Icons.done_all),
                label: Text(_isEdit ? 'Update' : 'Add'),
              ),
            ),
            // Center(
            //   child: RaisedButton(
            //     elevation: 3.0,
            //     onPressed: () {
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: Text('Select a color'),
            //             content: SingleChildScrollView(
            //               child: BlockPicker(
            //                 pickerColor: _currentColor,
            //                 onColorChanged: _changeColor,
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //     child: const Text('Add Color'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
