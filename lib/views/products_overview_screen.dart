import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ge/providers/products.dart';
import 'package:shop_ge/widgets/badge.dart';
import 'package:shop_ge/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (int selectValue) {
              if (selectValue == 1) {
                products.showFavoriteOnly();
              } else {
                products.showAll();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: 2,
              ),
            ],
          ),
          Badge(
            value: '2',
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
