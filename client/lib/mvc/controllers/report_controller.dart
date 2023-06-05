import 'package:flutter/material.dart';

import '../../enum/app_config_enum.dart';
import '../../enum/app_route_enum.dart';
import '../../enum/product_report_type_enum.dart';
import '../../service/app_config_service.dart';
import '../../service/report_service.dart';
import '../models/external/allergen_api_model.dart';
import '../models/external/product_allergen_api_model.dart';
import '../models/external/product_allergen_type_api_model.dart';
import '../models/external/product_api_model.dart';
import '../models/internal/product_model.dart';

class ReportController with ChangeNotifier {
  final ReportService reportService;
  final AppConfigService appConfigService;

  ReportController(this.reportService, this.appConfigService);

  Future<void> save(BuildContext context, ProductModel product, Map<AllergenAPIModel, ProductReportTypeEnum> allergens) async {
    String idDevice = await appConfigService.get(AppConfigEnum.idDevice.name);
    List<ProductAllergenAPIModel> productAllergens = [];

    for (var entry in allergens.entries) {
      String idAllergen = entry.key.idAllergen;
      ProductReportTypeEnum productAllergenType = entry.value;
      int index = productAllergenType.index + 1; // Necesitamos el ID, ya que index empieza de 0

      ProductAllergenAPIModel productAllergenAPIModel = ProductAllergenAPIModel(
          idDevice: idDevice,
          productAllergenType: ProductAllergenTypeAPIModel(idProductAllergenType: index),
          product: ProductAPIModel(idProduct: product.idProduct),
          allergen: AllergenAPIModel(idAllergen: idAllergen));
      productAllergens.add(productAllergenAPIModel);
    }

    ProductAPIModel productAPIModel = ProductAPIModel(idProduct: product.idProduct, allergens: productAllergens);
    reportService.reportAllergens(idDevice, productAPIModel);

    Navigator.of(context).pop();
    notifyListeners();
  }

  Future<Map<AllergenAPIModel, Map<ProductAllergenTypeAPIModel, int>>> getTotalByAllergen(String idProduct) async {
    return reportService.getTotalByAllergen(idProduct);
  }

  void report(BuildContext context, ProductModel product) {
    Navigator.pushNamed(context, AppRouteEnum.report.name, arguments: {"product": product});
  }
}
