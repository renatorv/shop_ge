import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ge/providers/products.dart';
import 'package:shop_ge/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProdiver = Provider.of<Products>(context);
    final products = productsProdiver.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i], //já existe um valor pre-existente, deve-se value
        child: ProductItem(),
      ),
    );
  }
}
