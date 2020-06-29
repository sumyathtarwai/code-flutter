import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//import 'package:provider/provider.dart';
import 'package:shop_demo/provider/product_item.dart';
import '../../../widgets/common/common_part_export.dart';

class ProductUpdate extends StatefulWidget {
  final ScrollController scrollController;
  final ProductItem product;
  const ProductUpdate({Key key, this.product, this.scrollController})
      : super(key: key);

  @override
  _ProductUpdateState createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          return await Util.showExitDialog(context);
        },
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.product != null
                  ? Container(
                      // height: 200,
                      child: ImageWidget(imagePath: widget.product.imageUrl),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          'New Product',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
              Expanded(child: ProductEditForm(product: widget.product)),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductEditForm extends StatefulWidget {
  const ProductEditForm({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductItem product;

  @override
  _ProductEditFormState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends State<ProductEditForm> {
  // TextEditingController _titleCtrl;
  // TextEditingController _descCtrl;
  // TextEditingController _priceCtrl;
  var _newProduct = ProductItem(
    id: null,
    title: null,
    desc: null,
    price: null,
    imageUrl: null,
    displayQty: 1,
    size: Size.free,
    color: [ColorCode.non],
  );
  TextEditingController _imageCtrl;
  final _formKey = GlobalKey<FormState>();
  final _descFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  //Color _currentColor = Colors.limeAccent;
  // void _changeColor(Color color) => setState(() => _currentColor = color);

  @override
  void initState() {
    // _titleCtrl = TextEditingController(text: widget.product?.title);
    _imageCtrl = TextEditingController(text: widget.product?.imageUrl);
    _imageFocusNode.addListener(() => _updatePreviewImage);
    super.initState();
  }

  @override
  void dispose() {
    // _titleCtrl.dispose();
    // _descCtrl.dispose();
    // _priceCtrl.dispose();
    _imageCtrl.dispose();

    _descFocusNode.dispose();
    _imageFocusNode.removeListener(() => _updatePreviewImage);
    _imageFocusNode.dispose();
    super.dispose();
  }

  void _updatePreviewImage() {
    if (!_imageFocusNode.hasFocus) {
      setState(() => {});
    }
  }

  void _saveForm() {
    if (_formKey.currentState.validate()) _formKey.currentState.save();
    print(_newProduct);
  }

  ProductItem _copyProductWith({
    String id,
    String title,
    String desc,
    double price,
    String imageUrl,
    Size size = Size.free,
    List<ColorCode> color = const [ColorCode.non],
    int displayQty = 1,
    bool isFavorite = false,
  }) {
    return ProductItem(
      id: id,
      title: title ?? _newProduct.title,
      desc: desc ?? _newProduct.desc,
      price: price ?? _newProduct.price,
      imageUrl: imageUrl ?? _newProduct.imageUrl,
      size: size,
      color: color,
      displayQty: displayQty,
      isFavorite: isFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    var textOf = Theme.of(context).textTheme;
    var product = widget.product;
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
                    _newProduct = _copyProductWith(title: newValue),
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
                    _newProduct = _copyProductWith(desc: newValue),
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
                onSaved: (newValue) => _newProduct =
                    _copyProductWith(price: double.parse(newValue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Qty',
                  border: OutlineInputBorder(),
                ),
                initialValue: '1',
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
                        onSaved: (newValue) =>
                            _newProduct = _copyProductWith(imageUrl: newValue),
                        onFieldSubmitted: (_) => _saveForm(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton.icon(
                onPressed: _saveForm,
                icon: Icon(Icons.done_all),
                label: Text(product != null ? 'Update' : 'Add'),
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
