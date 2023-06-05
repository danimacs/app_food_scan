import 'package:app_food_scan/data/app_config_dao.dart';

class AppConfigService {
  final AppConfigDAO appConfigDAO;

  AppConfigService(this.appConfigDAO);

  Future<Map<String, dynamic>> index() async {
    final List<Map<String, dynamic>> results = await appConfigDAO.read();
    final Map<String, dynamic> configs = {};

    for (final Map<String, dynamic> row in results) {
      final String key = row['KEY'];
      final dynamic value = row['VALUE'];
      configs[key] = value;
    }

    return configs;
  }

  Future<dynamic> get(String key) async {
    return await appConfigDAO.get(key);
  }

  Future<void> create(String key, dynamic value) async {
    await appConfigDAO.create(key, value);
  }
}
