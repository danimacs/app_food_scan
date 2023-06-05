class AllergenAPIModel {
  final String idAllergen;
  final String? name;

  static const tableName = 'Allergen';

  static const idAllergenProperty = 'idAllergen';
  static const nameProperty = 'name';

  AllergenAPIModel({required this.idAllergen, this.name});

  Map<String, dynamic> toJson() {
    return {
      idAllergenProperty: idAllergen,
      nameProperty: name,
    };
  }

  static AllergenAPIModel fromJson(Map<String, dynamic> map) {
    return AllergenAPIModel(
      idAllergen: map[idAllergenProperty],
      name: map[nameProperty],
    );
  }

  @override
  String toString() {
    return 'AllergenAPIModel{idAllergen: $idAllergen, name: $name}';
  }
}
