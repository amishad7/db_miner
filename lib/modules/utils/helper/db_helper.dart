import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  DBHelper dbHelper = DBHelper._();

  static String tableName = "Quotes";
  static Database? database;

  String qId = "id";
  String qAuthor = "qAuthor";
  String qCategory = "qCategory";
}
