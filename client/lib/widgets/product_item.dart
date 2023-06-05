import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../component/custom_future_builder.dart';
import '../config/styles.dart';
import '../mvc/controllers/product_controller.dart';
import '../mvc/models/internal/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  ProductItem({required this.product}) : super(key: UniqueKey());

  final ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<Product?>(
      future: product.productOFF,
      builder: (context, productOFF) {
        return Container(
          width: myProductWidth,
          height: myProductHeight,
          margin: myProductMargin,
          padding: myProductPadding,
          decoration: myProductDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productOFF?.productName ?? '',
                style: const TextStyle(fontSize: 22.0),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                productOFF?.brands ?? '',
                style: const TextStyle(fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
              ),
              Text(product.idProduct)
            ],
          ),
        );
      },
    );
  }
}
