import 'package:flutter/cupertino.dart';

import 'Category.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CategoryDatabaseHelper {
  static CategoryDatabaseHelper _databaseHelper; //Singleton
  static Database _database; //singleton

  String categoryTable = 'category_table';
  String colID = 'id';
  String colTitle = 'title';

  CategoryDatabaseHelper._createInstance();

  factory CategoryDatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = CategoryDatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

//custom getter
  Future<Database> get database async {
    if (_database == null) {
      _database = await initalizeDatabase();
    }
    return _database;
  }

  Future<Database> initalizeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'money_manager.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $categoryTable ($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT)');
  }

  Future<List<Map<String, dynamic>>> getCategoryMapList() async {
    Database db = await this.database;
    //optional
    // var result = await db.rawQuery('SELECT * from $noteTable order by $colPriority ASC');
    var result = await db.query(categoryTable, orderBy: '$colTitle ASC');
    return result;
  }

  Future<int> insertNote(Category category) async {
    Database db = await this.database;
    var result = await db.insert(categoryTable, category.toMap());
    return result;
  }

  Future<int> updateNote(Category category) async {
    Database db = await this.database;
    var result = await db.update(categoryTable, category.toMap(),
        where: '$colID = ?', whereArgs: [category.id]);
    return result;
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $categoryTable where $colID = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $categoryTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Category>> getCategoryList() async {
    var noteMapList = await getCategoryMapList();

    int count = noteMapList.length;

    List<Category> noteList = List<Category>();
    for (int i = 0; i < count; i++) {
      noteList.add(Category.fromMapObject(noteMapList[i]));
    }
    for (var item in noteList) {
      print(item.title);
    }
    return noteList;
  }
}
