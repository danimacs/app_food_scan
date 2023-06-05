import 'package:sqflite/sqflite.dart';

import '../enum/app_config_enum.dart';
import '../mvc/models/internal/app_config_model.dart';
import '../providers/database_provider.dart';

class StartupDAO {
  final DatabaseProvider databaseProvider;

  StartupDAO(this.databaseProvider);

  Database get database => databaseProvider.database;

  Future<bool> isFirstLaunch() async {
    final result = await database.query(AppConfigModel.tableName, where: '${AppConfigModel.keyColumn} = ?', whereArgs: [AppConfigEnum.isFirstLaunch.name]);
    return result.isNotEmpty && result.first[AppConfigModel.valueColumn] == '1';
  }

  Future<void> negateFirstLaunch() async {
    await database.update(AppConfigModel.tableName, {AppConfigModel.valueColumn: '0'}, where: '${AppConfigModel.keyColumn} = ?', whereArgs: [AppConfigEnum.isFirstLaunch.name]);
  }
}
