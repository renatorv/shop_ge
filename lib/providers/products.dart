import 'package:flutter/material.dart';
import 'package:shop_ge/data/dummy_data.dart';
import 'package:shop_ge/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);

    notifyListeners();
  }
}
