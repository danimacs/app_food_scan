import 'package:app_food_scan/service/product_service.dart';
import 'package:flutter/material.dart';

import '../../clients/flutter_barcode_scanner_client.dart';
import '../../enum/app_route_enum.dart';
import '../models/internal/product_model.dart';

class ProductController with ChangeNotifier {
  final ProductService productService;

  ProductController(this.productService);

  Future<List<ProductModel>> index() async {
    return productService.index();
  }

  Future<void> scanProduct(BuildContext context) async {
    String barcode = await FlutterBarcodeScannerClient.scanBarcode(context);

    if (barcode == "-1") {
      return;
    }

    ProductModel product = ProductModel(idProduct: barcode);
    product = await productService.create(product);

    view(context, product);
    notifyListeners();
  }

  void view(BuildContext context, ProductModel product) {
    Navigator.pushNamed(context, AppRouteEnum.product.name, arguments: {"product": product});
  }
}
