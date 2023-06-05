import 'package:app_food_scan/component/custom_future_builder.dart';
import 'package:app_food_scan/mvc/models/external/allergen_api_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../mvc/controllers/allergen_controller.dart';

class AllergenItem extends StatelessWidget {
  final AllergenController allergenController = GetIt.I<AllergenController>();

  final String idAllergen;

  AllergenItem({required this.idAllergen}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<AllergenAPIModel>(
      future: allergenController.read(idAllergen),
      builder: (context, allergen) {
        return Chip(label: Text(allergen != null ? allergen.name! : idAllergen));
      },
    );
  }
}
