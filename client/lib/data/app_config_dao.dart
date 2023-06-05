import 'package:sqflite/sqflite.dart';

import '../mvc/models/internal/app_config_model.dart';
import '../providers/database_provider.dart';

class AppConfigDAO {
  final DatabaseProvider databaseProvider;

  AppConfigDAO(this.databaseProvider);

  Database get database => databaseProvider.database;

  Future<dynamic> get(String key) async {
    List<Map<String, dynamic>> result = await database.query(
      AppConfigModel.tableName,
      where: '${AppConfigModel.keyColumn} = ?',
      whereArgs: [key],
    );

    if (result.isNotEmpty) {
      return result.first[AppConfigModel.valueColumn];
    }

    return null;
  }

  Future<List<Map<String, dynamic>>> read() async {
    return await database.query(AppConfigModel.tableName);
  }

  Future<void> create(String key, dynamic value) async {
    await database.insert(AppConfigModel.tableName, {AppConfigModel.keyColumn: key, AppConfigModel.valueColumn: value});
  }
}
