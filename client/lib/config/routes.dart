import 'package:flutter/material.dart';

import '../enum/app_route.dart';
import '../mvc/screens/home_screen.dart';
import '../mvc/screens/product_screen.dart';

final Map<String, WidgetBuilder> myRoutes = {
  AppRoute.home.name: (context) => HomeScreen(),
  AppRoute.product.name: (context) => ProductScreen(),
};
