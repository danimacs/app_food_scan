import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodFactsClient {
  OpenFoodFactsClient();

  static Future<Product?> getProductByBarcode(String barcode) async {
    final queryConfiguration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.SPANISH,
      version: ProductQueryVersion.v3,
    );

    final response = await OpenFoodAPIClient.getProductV3(queryConfiguration);
    return response.product;
  }
}
