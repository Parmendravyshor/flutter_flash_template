//sqlite_service.dart
// Purpose: Handles SQLite-related operations, including setting up the database, creating tables, inserting data, and running queries.

import '../data_source_view.dart';

class SQLiteService {
  Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT, value INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertItem(Database db, Map<String, dynamic> item) async {
    await db.insert('items', item,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getItems(Database db) async {
    return await db.query('items');
  }
}
