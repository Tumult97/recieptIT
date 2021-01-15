import 'package:path/path.dart';
import 'package:reciept_it/storage/models/receipt.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class Connection{
  static Future<Database> db;

  static void OpenDatabase() async{
    db = openDatabase(
      join(await getDatabasesPath(), "database.db"),
      onCreate: (db, version){
        var sql = "CREATE TABLE receipts (id INTEGER PRIMARY KEY, title TEXT, description TEXT, dateAdded DATETIME, dateModified DATETIME, dateOfReceipt DATETIME, amount REAL, comments TEXT, fileId INTEGER)";
        db.execute(sql);

        sql = "CREATE TABLE files (id INTEGER PRIMARY KEY, bytes BLOB, dateAdded DATETIME, fileName DATETIME)";
        db.execute(sql);

        return;
      }
    );
  }

  //region [ Receipts ]

  //insert Receipt
  static Future<void> insertReceipt(Receipt item) async{
    Database database = await db;

    database.insert(
      'receipts',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //list Receipts
  static Future<List<Receipt>> listReceipt() async{
    final database = await db;

    final List<Map<String, dynamic>> maps = await database.query('receipts');

    return List.generate(maps.length, (i) {
      return Receipt(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        dateAdded: maps[i]['dateAdded'],
        dateModified: maps[i]['dateModified'],
        dateOfReceipt: maps[i]['dateOfReceipt'],
        amount: maps[i]['amount'],
        comments: maps[i]['comments'],
        fileId: maps[i]['fileId'],
      );
    });
  }

  //update Receipt
  static Future<void> updateReceipt(Receipt item) async{
    final Database database = await db;

    await database.update(
      'receipts',
      item.toMap(),
      where: "id = ?",
      whereArgs: [item.id]
    );
  }

  //delete Receipt
  static Future<void> deleteReceipt(int id) async{
    final Database database = await db;

    await database.delete(
      'receipts',
      where: "id = ?",
      whereArgs: [id]
    );
  }

  static Future<Receipt> getReceipt(int id) async{
    final Database database = await db;

    List<Map<String, dynamic>> maps = await database.query(
      'receipts',
      where: 'id = ?',
      whereArgs: [id]
    );

    if(maps.length < 1)
      return null;

    var map = maps.first;
    return Receipt(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateAdded: map['dateAdded'],
      dateModified: map['dateModified'],
      dateOfReceipt: map['dateOfReceipt'],
      amount: map['amount'],
      comments: map['comments'],
      fileId: map['fileId'],
    );
  }

  //endregion
}