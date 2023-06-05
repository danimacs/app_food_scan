import 'dart:convert';

import 'package:app_food_scan/mvc/models/external/product_allergen_type_api_model.dart';
import 'package:http/http.dart' as http;

class ProductAllergenTypeService {
  ProductAllergenTypeService();

  final uri = 'http://155.133.23.131:8080/api/v1/product-allergen-type';

  Future<List<ProductAllergenTypeAPIModel>> index() async {
    final response = await http.get(
      Uri.parse(uri),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los datos');
    }

    final responseBody = utf8.decode(response.bodyBytes);
    final List<dynamic> productAllergenTypes = jsonDecode(responseBody);
    return productAllergenTypes.map((dynamic json) => ProductAllergenTypeAPIModel.fromJson(json)).toList();
  }
}
