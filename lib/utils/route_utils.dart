import 'package:flutter/material.dart';

class RouteUtils {
  static String getCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)?.settings.name ?? '';
  }

  static bool isInRoute(BuildContext context, String routeName) {
    String currentRoute = getCurrentRoute(context);
    return currentRoute == routeName;
  }
}
