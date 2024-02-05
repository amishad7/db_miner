import 'dart:developer';

import 'package:db_miner/modules/screens/home/model/Jsonbackmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  static String tableName = "Quotes";
  static Database? database;

  String qId = "id";
  String qAuthor = "qAuthor";
  String qCategory = "qCategory";
  String qQuote = "qQuote";
  String qLike = "qLike";

  initDB() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path, 'quotes.db');

    database = await openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE $tableName($qId INTEGER AUTOINCREMENT PRIMARY KEY, $qQuote TEXT NOT NULL, $qAuthor TEXT NOT NULL, $qCategory TEXT NOT NULL);";

      db.execute(query);
    });
  }

  Future<int?> insertQuery({required JsonModel jsonModel}) async {
    String query =
        "INSERT INTO $tableName($qQuote,$qAuthor,$qCategory) VALUES(?,?,?);";

    List argus = [jsonModel.quote, jsonModel.author, jsonModel.category];

    log('------------------------');
    log('------------------------');
    log('$argus');
    log('------------------------');
    log('------------------------');

    int? res = await database?.rawInsert(query, argus);

    return res;
  }

  showData() async {
    await initDB();

    String query = "SELECT * FROM $tableName";

    var data = await database?.rawQuery(query);
  }
}
