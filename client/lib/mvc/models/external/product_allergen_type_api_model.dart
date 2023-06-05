class ProductAllergenTypeAPIModel {
  final int idProductAllergenType;
  final String? name;

  static const tableName = 'ProductAllergenType';

  static const idProductAllergenTypeProperty = 'idProductAllergenType';
  static const nameProperty = 'name';

  ProductAllergenTypeAPIModel({required this.idProductAllergenType, this.name});

  Map<String, dynamic> toJson() {
    return {
      idProductAllergenTypeProperty: idProductAllergenType,
      nameProperty: name,
    };
  }

  static ProductAllergenTypeAPIModel fromJson(Map<String, dynamic> map) {
    return ProductAllergenTypeAPIModel(
      idProductAllergenType: map[idProductAllergenTypeProperty],
      name: map[nameProperty],
    );
  }

  @override
  String toString() {
    return 'ProductAllergenTypeAPIModel{idProductAllergenType: $idProductAllergenType, name: $name}';
  }
}
