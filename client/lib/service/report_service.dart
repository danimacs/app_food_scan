import 'dart:convert';

import 'package:app_food_scan/mvc/models/external/allergen_api_model.dart';
import 'package:http/http.dart' as http;

import '../mvc/models/external/product_allergen_type_api_model.dart';
import '../mvc/models/external/product_api_model.dart';

class ReportService {
  ReportService();

  final uri = 'http://10.0.2.2:8080/api/v1/product';

  Future<void> reportAllergens(String idDevice, ProductAPIModel productAPIModel) async {
    final response = await http.post(
      Uri.parse("$uri/$idDevice"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productAPIModel.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al realizar la solicitud POST');
    }
  }

  Future<Map<AllergenAPIModel, Map<ProductAllergenTypeAPIModel, int>>> getTotalByAllergen(String idProduct) async {
    final response = await http.get(Uri.parse('$uri/$idProduct/totals'));

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los datos');
    }

    final responseBody = utf8.decode(response.bodyBytes);
    final List<dynamic> dataList = jsonDecode(responseBody);
    final Map<AllergenAPIModel, Map<ProductAllergenTypeAPIModel, int>> totals = {};

    dataList.forEach((data) {
      final allergenJson = data['allergen'];
      final allergen = AllergenAPIModel.fromJson(allergenJson);
      final List<dynamic> typeTotalsData = data['typeTotals'];
      final Map<ProductAllergenTypeAPIModel, int> typeTotals = {};

      typeTotalsData.forEach((typeTotalData) {
        final typeJson = typeTotalData['type'];
        final typeModel = ProductAllergenTypeAPIModel.fromJson(typeJson);
        final total = typeTotalData['total'] as int;
        typeTotals[typeModel] = total;
      });

      totals[allergen] = typeTotals;
    });

    return totals;
  }
}
