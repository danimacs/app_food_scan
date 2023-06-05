import 'package:flutter/material.dart';

import '../../service/allergen_service.dart';
import '../models/external/allergen_api_model.dart';

class AllergenController with ChangeNotifier {
  final AllergenService allergenService;

  AllergenController(this.allergenService);

  Future<List<AllergenAPIModel>> index() async {
    return allergenService.index();
  }

  Future<AllergenAPIModel> read(String idAllergen) async {
    return allergenService.read(idAllergen);
  }
}
