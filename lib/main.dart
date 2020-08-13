import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ge/providers/cart.dart';
import 'package:shop_ge/providers/products.dart';
import 'package:shop_ge/utils/app_routes.dart';
import 'package:shop_ge/views/cart_screen.dart';
import 'package:shop_ge/views/product_detail_screen.dart';
import 'package:shop_ge/views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

//terminei aula 224
