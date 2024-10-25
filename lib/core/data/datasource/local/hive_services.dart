//hive_service.dart
// Purpose: Handles all operations related to Hive, such as initializing Hive, opening boxes (Hive's equivalent of tables), and storing/retrieving data.
// Content: Contains methods to store and retrieve data using Hive.
import 'package:hive_flutter/hive_flutter.dart';

import '../data_source_view.dart';

class HiveService {
  Future<void> initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox('myBox');
  }

  void storeData(String key, dynamic value) {
    var box = Hive.box('myBox');
    box.put(key, value);
  }

  dynamic getData(String key) {
    var box = Hive.box('myBox');
    return box.get(key);
  }
}
