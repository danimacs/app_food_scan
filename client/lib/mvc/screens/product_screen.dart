import 'package:app_food_scan/enum/product_report_type_enum.dart';
import 'package:app_food_scan/mvc/controllers/allergen_controller.dart';
import 'package:app_food_scan/mvc/models/external/allergen_api_model.dart';
import 'package:app_food_scan/mvc/models/internal/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../component/custom_app_bar.dart';
import '../../config/styles.dart';
import '../../enum/product_info_type_enum.dart';
import '../../widgets/product_info_panel.dart';
import '../../widgets/product_item.dart';
import '../../widgets/product_votes_panel.dart';
import '../controllers/report_controller.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen() : super(key: UniqueKey());

  final AllergenController allergenController = GetIt.I<AllergenController>();
  final ReportController reportController = GetIt.I<ReportController>();

  late final ProductModel product;
  final Map<AllergenAPIModel, ProductReportTypeEnum> allergens = <AllergenAPIModel, ProductReportTypeEnum>{};

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? params = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    product = params?['product'];

    return Scaffold(
      appBar: customAppBar,
      body: SingleChildScrollView(
        child: Container(
          margin: myProductMargin,
          padding: myProductPadding,
          child: Column(
            children: [
              ProductItem(product: product),
              ProductInfoPanel(product: product, productInfoType: ProductInfoTypeEnum.allergens),
              ProductInfoPanel(product: product, productInfoType: ProductInfoTypeEnum.traces),
              ProductVotesPanel(product: product),
            ],
          ),
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => reportController.report(context, product),
      child: const Icon(Icons.how_to_vote_sharp),
    );
  }
}
