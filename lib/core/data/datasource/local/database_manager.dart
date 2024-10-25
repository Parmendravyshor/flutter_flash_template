// database_manager.dart
// Purpose: A unified manager that handles operations across Hive, SQLite, and Shared Preferences. This abstraction makes it easier for the rest of the app to interact with different data sources without needing to worry about which specific database is being used.
// Content: Contains references to HiveService, SQLiteService, and SharedPreferencesService, and provides combined methods for data handling.
import '../data_source_view.dart';

class DatabaseManager {
  static Database? _database; // Use '?' to allow null safety
  // DBProvider._();
  // static final DBProvider db = DBProvider._();
  final HiveService _hiveService = HiveService();
  final SQLiteService _sqliteService = SQLiteService();
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();

  Future<void> initDatabases() async {
    await _hiveService.initHive();
    // Initialize SQLite and SharedPreferences as needed
  }

  // Use methods from each service
  Future<void> storeDataInHive(String key, dynamic value) async {
    _hiveService.storeData(key, value);
  }

  Future<void> savePreference(String key, String value) async {
    await _sharedPreferencesService.saveData(key, value);
  }

  Future<List<Map<String, dynamic>>> fetchSqliteItems(Database db) async {
    return _sqliteService.getItems(db);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "message.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE message ("
          "id INTEGER PRIMARY KEY,"
          "message TEXT,"
          "type INTEGER"
          ")");
    });
  }
}
