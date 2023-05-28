import 'package:sqflite/sqflite.dart';

import '../mvc/models/product_model.dart';
import '../providers/database_provider.dart';

class ProductDAO {
  final DatabaseProvider databaseProvider;

  ProductDAO(this.databaseProvider);

  Database get database => databaseProvider.database;

  Future<List<Map<String, dynamic>>> read() async {
    var query = 'SELECT * FROM ${ProductModel.tableName} ORDER BY TIMESTAMP DESC';
    return await database.rawQuery(query);
  }

  Future<void> create(ProductModel product) async {
    await database.insert(ProductModel.tableName, product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
