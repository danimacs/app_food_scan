import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  final Database _database;

  DatabaseProvider(this._database);

  Database get database => _database;

  static Future<Database> setupDatabase() async {
    final databasePath = await getDatabasesPath();
    const databaseName = 'my_database.db';

    final database = await openDatabase(
      join(databasePath, databaseName),
      version: 1,
      onCreate: (db, version) => executeSQLScript(db),
    );

    return database;
  }

  static Future<void> executeSQLScript(Database db) async {
    String sqlScript = await rootBundle.loadString('assets/database_script.sql');
    List<String> statements = sqlScript.split(';');

    for (String statement in statements) {
      if (statement.trim().isEmpty) continue;
      await db.execute(statement);
    }
  }
}
