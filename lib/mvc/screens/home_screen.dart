import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../component/custom_app_bar.dart';
import '../../component/custom_future_builder.dart';
import '../../widgets/products_grid.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: UniqueKey());

  final ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Consumer<ProductController>(
        builder: (context, productController, _) {
          return CustomFutureBuilder<List<ProductModel>>(
            future: productController.index(),
            builder: (context, products) => ProductsGrid(products: products!),
          );
        },
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => productController.scanProduct(context),
      child: const Icon(Icons.camera_alt_outlined),
    );
  }
}
