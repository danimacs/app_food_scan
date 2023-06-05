import 'package:app_food_scan/enum/product_report_type_enum.dart';
import 'package:app_food_scan/mvc/controllers/allergen_controller.dart';
import 'package:app_food_scan/mvc/models/external/allergen_api_model.dart';
import 'package:app_food_scan/mvc/models/internal/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../component/custom_app_bar.dart';
import '../../component/custom_future_builder.dart';
import '../../config/styles.dart';
import '../controllers/report_controller.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen() : super(key: UniqueKey());

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final AllergenController allergenController = GetIt.I<AllergenController>();
  final ReportController reportController = GetIt.I<ReportController>();

  late final ProductModel product;
  final Map<AllergenAPIModel, ProductReportTypeEnum> allergens = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic>? params = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      setState(() {
        product = params?['product'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Container(
        margin: myProductMargin,
        padding: myProductPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioButtonsPanel(context),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildRadioButtonsPanel(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: myProductPadding,
          child: _buildRadioButtons(context),
        ),
      ),
    );
  }

  Widget _buildRadioButtons(BuildContext context) {
    return CustomFutureBuilder<List<AllergenAPIModel>>(
      future: allergenController.index(),
      builder: (context, allergensData) {
        if (allergens.isEmpty) {
          for (var allergen in allergensData!) {
            allergens[allergen] = ProductReportTypeEnum.unknown;
          }
        }

        const List<DataColumn> columns = [
          DataColumn(
            label: SizedBox(
              width: 80,
              child: Text('Allergen'),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 20,
              child: Text('Sí'),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 20,
              child: Text('No'),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 20,
              child: Text('Ns'),
            ),
          ),
        ];

        final List<DataRow> rows = [
          for (var entry in allergens.entries)
            DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 80,
                    child: Text(entry.key.name!),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 20,
                    child: _buildRadioButton(entry.key, allergens[entry.key]!, ProductReportTypeEnum.yes),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 20,
                    child: _buildRadioButton(entry.key, allergens[entry.key]!, ProductReportTypeEnum.no),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 20,
                    child: _buildRadioButton(entry.key, allergens[entry.key]!, ProductReportTypeEnum.unknown),
                  ),
                ),
              ],
            ),
        ];

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: columns,
            rows: rows,
          ),
        );
      },
    );
  }

  Widget _buildRadioButton(AllergenAPIModel allergen, ProductReportTypeEnum selectedValue, ProductReportTypeEnum radioValue) {
    return Radio<ProductReportTypeEnum>(
      value: radioValue,
      groupValue: selectedValue,
      onChanged: (newValue) {
        setState(() {
          allergens[allergen] = newValue!;
        });
      },
    );
  }

  Container _buildButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => reportController.save(context, product, allergens),
          child: const Text('Enviar'),
        ),
      ),
    );
  }
}
