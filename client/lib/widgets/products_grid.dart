import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../config/styles.dart';
import '../mvc/controllers/product_controller.dart';
import '../mvc/models/internal/product_model.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  ProductsGrid({required this.products}) : super(key: UniqueKey());

  final ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: myProductPadding,
      gridDelegate: myGridDelegate,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => view(context, product),
          child: ProductItem(product: product, fromMenu: true),
        );
      },
    );
  }

  void view(BuildContext context, ProductModel product) {
    productController.view(context, product);
  }
}
