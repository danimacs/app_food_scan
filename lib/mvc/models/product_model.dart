import 'package:openfoodfacts/openfoodfacts.dart';

import '../../clients/open_food_facts_client.dart';

class ProductModel {
  final String idProduct;
  late Future<Product?> productOFF;

  static const tableName = 'PRODUCT';

  static const idProductColumn = 'ID_PRODUCT';
  static const idTimestampColumn = 'TIMESTAMP';

  ProductModel({required this.idProduct}) {
    productOFF = OpenFoodFactsClient.getProductByBarcode(idProduct);
  }

  Map<String, dynamic> toMap() {
    return {
      idProductColumn: idProduct,
    };
  }

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      idProduct: map[idProductColumn],
    );
  }

  @override
  String toString() {
    return 'ProductModel{idProduct: $idProduct}';
  }
}
