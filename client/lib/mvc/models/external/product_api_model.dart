import 'package:app_food_scan/mvc/models/external/product_allergen_api_model.dart';

class ProductAPIModel {
  final String idProduct;
  final List<ProductAllergenAPIModel>? allergens;

  static const tableName = 'Product';

  static const idProductProperty = 'idProduct';
  static const allergensProperty = 'allergens';

  ProductAPIModel({required this.idProduct, this.allergens});

  Map<String, dynamic> toJson() {
    return {
      idProductProperty: idProduct,
      allergensProperty: allergens?.map((allergen) => allergen.toJson()).toList(),
    };
  }

  static ProductAPIModel fromJson(Map<String, dynamic> map) {
    List<dynamic>? allergensData = map[allergensProperty];
    List<ProductAllergenAPIModel>? allergensList;
    if (allergensData != null) {
      allergensList = allergensData.map<ProductAllergenAPIModel>((allergen) {
        return ProductAllergenAPIModel.fromJson(allergen);
      }).toList();
    }

    return ProductAPIModel(
      idProduct: map[idProductProperty],
      allergens: allergensList,
    );
  }

  @override
  String toString() {
    return 'ProductModel{idProduct: $idProduct}';
  }
}
