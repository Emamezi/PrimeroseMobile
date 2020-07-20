import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  //creating a database
  static Future<sql.Database> dataBase() async {
    final dbPath = await sql
        .getDatabasesPath(); // geting the database stored path on the users device
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, placeImage TEXT , loc_lat REAL, loc_long REAL, address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    await DBHelper.dataBase()
      ..insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.dataBase();
    return db.query(table);
  }
}
