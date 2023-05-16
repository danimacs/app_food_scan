import 'package:flutter/material.dart';

import '../component/custom_future_builder.dart';
import '../config/styles.dart';
import '../enum/product_info_type.dart';
import '../mvc/models/product_model.dart';
import 'product_info_item.dart';

class ProductInfoPanel extends StatelessWidget {
  final ProductModel product;
  final ProductInfoType productInfoType;

  ProductInfoPanel({required this.product, required this.productInfoType}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: product.productOFF,
      builder: (context, productOFF) {
        List<String>? allergens;

        switch (productInfoType) {
          case ProductInfoType.allergens:
            var title = "Allergens";
            allergens = productOFF?.allergens?.ids;
            return _buildContainer(title, allergens);
          case ProductInfoType.traces:
            var title = "Traces";
            allergens = productOFF?.tracesTags;
            return _buildContainer(title, allergens);
          default:
            throw Exception();
        }
      },
    );
  }

  Widget _buildContainer(String title, List<String>? allergens) {
    return Container(
      width: myProductWidth,
      margin: myProductMargin,
      padding: myProductPadding,
      decoration: myProductDecoration,
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22.0),
              overflow: TextOverflow.ellipsis,
            ),
            _buildAllergenItems(allergens),
          ],
        ),
      ),
    );
  }

  Widget _buildAllergenItems(List<String>? allergens) {
    if (allergens!.isNotEmpty) {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: allergens.map((idAllergen) {
          return ProductInfoItem(idAllergen: idAllergen);
        }).toList(),
      );
    } else {
      return const Text("Not found");
    }
  }
}
