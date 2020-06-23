import '../provider/modal.dart';

final dummyProduct = [
  Product(
    id: 'p1',
    title: 'Shirt',
    desc: 'A red shirt - it is pretty red!',
    price: 29.99,
    color: [
      ColorCode.red,
      ColorCode.blue,
      ColorCode.yellow,
      ColorCode.brown,
      ColorCode.gray,
      ColorCode.black,
      ColorCode.white
    ],
    size: Size.free,
    imageUrl:
        'https://images.unsplash.com/photo-1511746315387-c4a76990fdce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p2',
    title: 'Trouser',
    desc: 'A nice pair of trousers',
    color: [ColorCode.non],
    size: Size.inch25,
    price: 59.99,
    imageUrl:
        'https://images.unsplash.com/photo-1584382296087-ac00c7263710?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p3',
    title: 'Scarf',
    desc: 'Warm and cozy - exactly what you need for the winter',
    color: [ColorCode.gray, ColorCode.yellow],
    price: 19.99,
    size: Size.free,
    imageUrl:
        'https://images.unsplash.com/photo-1549401334-b71409ed03ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Product(
    id: 'p4',
    title: 'Pan',
    desc: 'Prepare any meal you want',
    color: [ColorCode.black],
    price: 49.99,
    imageUrl:
        'https://images.unsplash.com/photo-1583777620797-5e0a34794f74?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
];
