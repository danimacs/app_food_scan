import 'dart:convert';

import 'package:http/http.dart' as http;

import '../mvc/models/external/allergen_api_model.dart';

class AllergenService {
  AllergenService();

  final uri = 'http://10.0.2.2:8080/api/v1/allergen';

  Future<List<AllergenAPIModel>> index() async {
    final response = await http.get(
      Uri.parse(uri),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los datos');
    }

    final responseBody = utf8.decode(response.bodyBytes);
    final List<dynamic> allergens = jsonDecode(responseBody);
    return allergens.map((dynamic json) => AllergenAPIModel.fromJson(json)).toList();
  }

  Future<AllergenAPIModel> read(String idAllergen) async {
    final response = await http.get(
      Uri.parse("$uri/$idAllergen"),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los datos');
    }

    final responseBody = utf8.decode(response.bodyBytes);
    final dynamic allergenJson = jsonDecode(responseBody);
    return AllergenAPIModel.fromJson(allergenJson);
  }
}
