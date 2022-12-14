import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:usuarios/infrestructure/local/sqlite/base_sqlite_service.dart';

class SqliteService extends BaseSqliteService {
  String dbName = 'DataBase.db';

  @override
  Future<String> getPathDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dirStringPath = directory.path;
    return '$dirStringPath/$dbName';
  }

  @override
  Future createDB() async {
    String path = await getPathDatabase();
    if (kDebugMode) {
      print(path);
    }
    await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  void _createDb(Database db, int newVersion) async {
    await db.transaction((txn) async {
      await txn.execute(
          'CREATE TABLE [User] ([id] INT, [name] TEXT, [username] TEXT, [email] TEXT, [phone] TEXT, [website] TEXT);');
      await txn.execute(
          'CREATE TABLE [Address] ([userId] INT,[street] TEXT, [suite] TEXT,[city] TEXT,[zipcode] TEXT,[lat] TEXT,[lng] TEXT);');
      await txn.execute(
          'CREATE TABLE [Company] ([userId] INT,[name] TEXT,[catchPhrase] TEXT,[bs] TEXT);');
      await txn.execute(
          'CREATE TABLE [Posts] ( [userId] INT, [id] INT, [title] TEXT, [body] TEXT );');
    });
  }

  @override
  Future<bool> isDatabase() async {
    Database? db;
    bool isDatabase = false;
    String path = await getPathDatabase();
    try {
      db = await openReadOnlyDatabase(path);
      isDatabase = true;
    } catch (error) {
      print('error*****');
      print(error);
    } finally {
      await db?.close();
    }
    return isDatabase;
  }

  @override
  Future<Database> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dirStringPath = dir.path;
    return await openDatabase(join(dirStringPath, dbName));
  }

  @override
  Future closeDB(Database db) async {
    await db.close();
  }
}
