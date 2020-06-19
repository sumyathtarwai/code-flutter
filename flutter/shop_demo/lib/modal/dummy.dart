import './modal.dart';

const dummyProduct = const [
  Product(
    id: 'p1',
    title: 'Red Shirt',
    desc: 'A red shirt - it is pretty red!',
    price: 29.99,
    color: ColorCode.red,
    size: Size.free,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ),
  Product(
    id: 'p2',
    title: 'Trousers',
    desc: 'A nice pair of trousers',
    color: ColorCode.non,
    size: Size.inch25,
    price: 59.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
  ),
  Product(
    id: 'p3',
    title: 'Yellow Scarf',
    desc: 'Warm and cozy - exactly what you need for the winter',
    color: ColorCode.yellow,
    price: 19.99,
    imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    desc: 'Prepare any meal you want',
    color: ColorCode.black,
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
  ),
];
