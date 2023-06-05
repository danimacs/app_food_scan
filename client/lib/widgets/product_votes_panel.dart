import 'package:app_food_scan/mvc/controllers/product_allergen_type_controller.dart';
import 'package:app_food_scan/widgets/abstract_product_panel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../component/custom_future_builder.dart';
import '../mvc/controllers/report_controller.dart';
import '../mvc/models/external/allergen_api_model.dart';
import '../mvc/models/external/product_allergen_type_api_model.dart';
import '../mvc/models/internal/product_model.dart';

class ProductVotesPanel extends AbstractProductPanel {
  final ReportController reportController = GetIt.I<ReportController>();
  final ProductAllergenTypeController productAllergenTypeController = GetIt.I<ProductAllergenTypeController>();

  final ProductModel product;

  ProductVotesPanel({required this.product}) : super(key: UniqueKey(), product: product);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportController>(builder: (context, reportController, _) {
      return CustomFutureBuilder(
        future: Future.wait([
          reportController.getTotalByAllergen(product.idProduct),
          productAllergenTypeController.index(),
        ]),
        builder: (context, data) {
          return buildContainer("Informados", data);
        },
      );
    });
  }

  @override
  Widget buildAllergenItems(dynamic data) {
    Map<AllergenAPIModel, Map<ProductAllergenTypeAPIModel, int>> totals = data[0];
    List<ProductAllergenTypeAPIModel> productAllergenTypes = data[1];

    final List<DataColumn> columns = [
      const DataColumn(
        label: SizedBox(
          width: 80,
          child: Text('Allergen'),
        ),
      ),
      for (var productAllergenType in productAllergenTypes)
        DataColumn(
          label: SizedBox(
            width: 20,
            child: Text(productAllergenType.name!),
          ),
        ),
    ];

    final List<DataRow> rows = [
      for (var allergenEntry in totals.entries)
        DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: 80,
                child: Text(allergenEntry.key.name!),
              ),
            ),
            for (var allergenTypeEntry in allergenEntry.value.entries)
              DataCell(
                SizedBox(
                  width: 20,
                  child: Text(allergenTypeEntry.value.toString()),
                ),
              ),
          ],
        ),
    ];

    return DataTable(
      columns: columns,
      rows: rows,
    );
  }
}
