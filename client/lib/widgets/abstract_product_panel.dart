import 'package:flutter/material.dart';

import '../config/styles.dart';
import '../mvc/models/internal/product_model.dart';

abstract class AbstractProductPanel extends StatelessWidget {
  final ProductModel product;

  AbstractProductPanel({required key, required this.product}) : super(key: UniqueKey());

  Widget buildContainer(String title, dynamic allergens) {
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
            buildAllergenItems(allergens),
          ],
        ),
      ),
    );
  }

  Widget buildAllergenItems(dynamic data);
}
