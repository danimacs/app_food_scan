import 'package:flutter/material.dart';

import '../enum/app_route_enum.dart';
import '../mvc/screens/home_screen.dart';
import '../mvc/screens/product_screen.dart';
import '../mvc/screens/report_screen.dart';

final Map<String, WidgetBuilder> myRoutes = {
  AppRouteEnum.home.name: (context) => HomeScreen(),
  AppRouteEnum.product.name: (context) => ProductScreen(),
  AppRouteEnum.report.name: (context) => ReportScreen(),
};
