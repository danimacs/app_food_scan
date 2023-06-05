import 'package:flutter/material.dart';

import '../../service/product_allergen_type_service.dart';
import '../models/external/product_allergen_type_api_model.dart';

class ProductAllergenTypeController with ChangeNotifier {
  final ProductAllergenTypeService productAllergenTypeService;

  ProductAllergenTypeController(this.productAllergenTypeService);

  Future<List<ProductAllergenTypeAPIModel>> index() async {
    return productAllergenTypeService.index();
  }
}
