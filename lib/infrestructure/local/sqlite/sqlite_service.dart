import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:usuarios/infrestructure/local/sqlite/base_sqlite_service.dart';

class SqliteService extends BaseSqliteService {
  String dbName = 'DataBase.db';

  /*
  Obtiene la ruta de almacenamiento para guarda la BD
  */
  @override
  Future<String> getPathDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dirStringPath = directory.path;
    return '$dirStringPath/$dbName';
  }

  /*
  Crea la bd
  */
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

  /*
  Se ejecutan comando al momento de crear la BD
  */
  void _createDb(Database db, int newVersion) async {
    await db.transaction((txn) async {
      await txn.execute(
          'CREATE TABLE [User] ([id] INT, [nameC] TEXT, [username] TEXT, [email] TEXT, [phone] TEXT, [website] TEXT);');
      await txn.execute(
          'CREATE TABLE [Address] ([userId] INT,[street] TEXT, [suite] TEXT,[city] TEXT,[zipcode] TEXT,[lat] TEXT,[lng] TEXT);');
      await txn.execute(
          'CREATE TABLE [Company] ([userId] INT,[name] TEXT,[catchPhrase] TEXT,[bs] TEXT);');
      await txn.execute(
          'CREATE TABLE [Posts] ( [userId] INT, [id] INT, [title] TEXT, [body] TEXT );');
    });
  }

  /*
  Valida ya exista la BD para utilizarla o crearla respectivamente
  */
  @override
  Future<bool> isDatabase() async {
    bool isDatabase = false;
    String path = await getPathDatabase();
    isDatabase = await File(path).exists();
    return isDatabase;
  }

  /* Permite abrir la BD para su respectivo uso
  */
  @override
  Future<Database> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dirStringPath = dir.path;
    return await openDatabase(join(dirStringPath, dbName));
  }

  /*
  Cierra la BD para evitar dejar procesos abierto 
  */
  @override
  Future closeDB(Database db) async {
    await db.close();
  }
}
