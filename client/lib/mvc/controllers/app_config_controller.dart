import 'package:flutter/material.dart';

import '../../service/app_config_service.dart';

class AppConfigController with ChangeNotifier {
  final AppConfigService appConfigService;

  AppConfigController(this.appConfigService);

  Future<void> create(String key, dynamic value) async {
    return appConfigService.create(key, value);
  }
}
