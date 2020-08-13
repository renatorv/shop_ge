import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ge/providers/cart.dart';
import 'package:shop_ge/providers/product.dart';
import 'package:shop_ge/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    // listen: false, deve ser usado quando for utilizar atributos finais, ex.: titulo, descricao
    // Consumer é um widget, assim pode-se utilizar ele em uma parte especifica do código.

    final Cart cart = Provider.of(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, productItem, _) => IconButton(
              icon: Icon(productItem.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                productItem.toggleFavorite();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product);

              print(cart.itemsCount);
            },
          ),
        ),
      ),
    );
  }
}
