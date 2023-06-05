import 'package:flutter/material.dart';

import '../component/custom_future_builder.dart';
import '../enum/product_info_type_enum.dart';
import '../mvc/models/internal/product_model.dart';
import 'abstract_product_panel.dart';
import 'allergen_item.dart';

class ProductInfoPanel extends AbstractProductPanel {
  final ProductModel product;
  final ProductInfoTypeEnum productInfoType;

  ProductInfoPanel({required this.product, required this.productInfoType}) : super(key: UniqueKey(), product: product);

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: product.productOFF,
      builder: (context, productOFF) {
        List<String>? allergens;

        switch (productInfoType) {
          case ProductInfoTypeEnum.allergens:
            var title = "Allergens";
            allergens = productOFF?.allergens?.ids;
            return super.buildContainer(title, allergens);
          case ProductInfoTypeEnum.traces:
            var title = "Traces";
            allergens = productOFF?.tracesTags;
            return super.buildContainer(title, allergens);
          default:
            throw Exception();
        }
      },
    );
  }

  Widget buildAllergenItems(dynamic data) {
    List<String> allergens = data;

    if (allergens.isNotEmpty) {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: allergens.map((idAllergen) {
          return AllergenItem(idAllergen: idAllergen);
        }).toList(),
      );
    } else {
      return const Text("Not found");
    }
  }
}
