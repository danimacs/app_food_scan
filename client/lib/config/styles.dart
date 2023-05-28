import 'package:flutter/material.dart';

const double myProductWidth = double.infinity;
const double myProductHeight = 150;

const EdgeInsets myProductMargin = EdgeInsets.all(5);
const EdgeInsets myProductPadding = EdgeInsets.all(10);

BoxDecoration myProductDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));

const SliverGridDelegateWithFixedCrossAxisCount myGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
