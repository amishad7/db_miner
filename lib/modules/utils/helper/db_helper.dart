import 'dart:developer';

import 'package:db_miner/modules/screens/home/model/Json-model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  static String tableName = "Quotes";
  static Database? database;

  String id = "id";
  String author = "author";
  String category = "category";
  String quote = "quote";
  String like = "like";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'quotes.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT, $quote TEXT NOT NULL , $author TEXT NOT NULL , $category TEXT NOT NULL);";
        db.execute(query);
      },
    );
  }

  Future<int?> insertQuery({required JsonModel jsonModel}) async {
    await initDB();

    String query =
        "INSERT INTO $tableName($quote,$author,$category) VALUES(?,?,?);";

    List args = [jsonModel.quote, jsonModel.author, jsonModel.category];
    int? res = await database?.rawInsert(query, args);

    return res;
  }

  Future<List<JsonModel>?> showData() async {
    await initDB();

    String query = "SELECT * FROM $tableName;";
    List<Map<String, Object?>>? data = await database?.rawQuery(query);
    List<JsonModel>? tableData =
        data?.map((e) => JsonModel.fetchData(data: e)).toList();

    return tableData;
  }

  Future<int?> deleteQuery({required int id}) async {
    await initDB();
    String query = "DELETE FROM $tableName WHERE id=$id;";
    int? res = await database?.rawDelete(query);
    return res;
  }

  Future<int?> updateCategory({required String name, required int dId}) async {
    await initDB();
    String query = "UPDATE $tableName SET $quote=?,$author=? WHERE $id=?;";
    List args = [name, dId];
    int? res = await database?.rawUpdate(query, args);
    return res;
  }

  Future<List<JsonModel>?> searchCategory({required String searchData}) async {
    await initDB();
    String query =
        "SELECT * FROM $tableName WHERE $category LIKE '%$searchData%'";
    List<Map<String, Object?>>? data = await database?.rawQuery(query);
    log("${data}");
    List<JsonModel>? searchTable =
        data?.map((e) => JsonModel.fetchData(data: e)).toList();
    return searchTable;
  }
}
