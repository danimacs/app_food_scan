import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../component/custom_future_builder.dart';
import '../config/styles.dart';
import '../mvc/controllers/allergen_controller.dart';
import '../mvc/models/external/allergen_api_model.dart';

class ProductVoteAllergensPanel extends StatefulWidget {
  ProductVoteAllergensPanel() : super(key: UniqueKey());

  @override
  State<ProductVoteAllergensPanel> createState() => _ProductVoteAllergensPanelState();
}

class _ProductVoteAllergensPanelState extends State<ProductVoteAllergensPanel> {
  final AllergenController allergenController = GetIt.I<AllergenController>();

  late final List<bool> checkedValues = [];

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<AllergenAPIModel>>(
      future: allergenController.index(),
      builder: (context, allergens) {
        if (checkedValues.isNotEmpty) {
          checkedValues.clear();
        }
        checkedValues.addAll(List<bool>.filled(allergens!.length, false));

        return Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: myProductPadding,
                child: Column(
                  children: allergens.asMap().entries.map((entry) {
                    int index = entry.key;
                    return CheckboxListTile(
                      title: Text(entry.value.idAllergen),
                      value: checkedValues[index],
                      onChanged: (value) {
                        setState(() {
                          checkedValues[index] = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
