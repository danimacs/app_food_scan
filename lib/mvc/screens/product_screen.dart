import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';
import '../../config/styles.dart';
import '../../enum/product_info_type.dart';
import '../../widgets/product_info_panel.dart';
import '../../widgets/product_item.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? params = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    dynamic product = params?['product'];

    return Scaffold(
      appBar: customAppBar,
      body: Container(
        margin: myProductMargin,
        padding: myProductPadding,
        child: Column(
          children: [
            ProductItem(product: product),
            ProductInfoPanel(product: product, productInfoType: ProductInfoType.allergens),
            ProductInfoPanel(product: product, productInfoType: ProductInfoType.traces),
          ],
        ),
      ),
    );
  }
}
