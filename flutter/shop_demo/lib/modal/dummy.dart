import '../provider/modal.dart';

final dummyProduct = [
  Product(
    id: 'p1',
    title: 'ORIGINALS 3-STRIPES TEE',
    desc: 'A cotton tee inspired by retro style.',
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
    title: 'JEANS',
    desc: 'A nice pair of jeans',
    color: [ColorCode.non],
    size: Size.inch25,
    price: 59.99,
    imageUrl:
        'https://images.unsplash.com/photo-1584382296087-ac00c7263710?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p3',
    title: 'SCARF',
    desc: 'Warm and cozy - exactly what you need for the winter',
    color: [ColorCode.gray, ColorCode.black],
    price: 9.99,
    size: Size.free,
    imageUrl:
        'https://images.unsplash.com/photo-1549401334-b71409ed03ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p4',
    title: 'SHORT PANTS',
    desc: 'Casual ware',
    color: [ColorCode.blue],
    price: 19.99,
    imageUrl:
        'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80',
  ),
  Product(
    id: 'p5',
    title: 'SHIRT',
    desc: 'Free style cotton shirt',
    color: [ColorCode.gray, ColorCode.white],
    price: 9.99,
    size: Size.free,
    imageUrl:
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p6',
    title: 'DRESS',
    desc: 'Style and cozy - for summer',
    color: [ColorCode.red, ColorCode.blue],
    price: 9.99,
    size: Size.free,
    imageUrl:
        'https://images.unsplash.com/photo-1572804013427-4d7ca7268217?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ),
];
