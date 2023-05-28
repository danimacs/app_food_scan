import 'package:flutter/material.dart';

class ProductInfoItem extends StatelessWidget {
  final String idAllergen;

  ProductInfoItem({required this.idAllergen}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(idAllergen));
  }
}
