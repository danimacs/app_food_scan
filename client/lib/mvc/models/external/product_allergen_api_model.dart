import 'package:app_food_scan/mvc/models/external/allergen_api_model.dart';
import 'package:app_food_scan/mvc/models/external/product_allergen_type_api_model.dart';
import 'package:app_food_scan/mvc/models/external/product_api_model.dart';

class ProductAllergenAPIModel {
  final int? idProductAllergen;
  final String idDevice;
  final ProductAllergenTypeAPIModel productAllergenType;
  final ProductAPIModel? product;
  final AllergenAPIModel allergen;

  static const tableName = 'ProductAllergen';

  static const idProductAllergenProperty = 'idProductAllergen';
  static const idDeviceProperty = 'idDevice';
  static const productAllergenTypeProperty = 'productAllergenType';
  static const productProperty = 'product';
  static const allergenProperty = 'allergen';

  ProductAllergenAPIModel({required this.idDevice, required this.productAllergenType, required this.product, required this.allergen, this.idProductAllergen});

  Map<String, dynamic> toJson() {
    return {
      idProductAllergenProperty: idProductAllergen,
      idDeviceProperty: idDevice,
      productAllergenTypeProperty: productAllergenType.toJson(),
      productProperty: product?.toJson(),
      allergenProperty: allergen.toJson(),
    };
  }

  static ProductAllergenAPIModel fromJson(Map<String, dynamic> map) {
    return ProductAllergenAPIModel(
      idProductAllergen: map[idProductAllergenProperty],
      idDevice: map[idDeviceProperty],
      productAllergenType: ProductAllergenTypeAPIModel.fromJson(map[productAllergenTypeProperty]),
      product: map[productProperty] != null ? ProductAPIModel.fromJson(map[productProperty]) : null,
      allergen: AllergenAPIModel.fromJson(map[allergenProperty]),
    );
  }

  @override
  String toString() {
    return 'ProductAllergenAPIModel{idProductAllergen: $idProductAllergen, idDevice: $idDevice, product: $product, allergen: $allergen}';
  }
}
