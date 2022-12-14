import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

abstract class BaseSqliteService {
  Future<String> getPathDatabase();
  Future createDB();
  Future<dynamic> openDB();
  Future<dynamic> closeDB(Database db);
  Future<bool> isDatabase();
}
