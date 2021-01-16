import 'package:path/path.dart';
import 'package:reciept_it/storage/models/receipt.dart';
import 'package:reciept_it/storage/types/receipttype.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class Connection{
  static Database db;

  static void initDb() async{
    
    await deleteDatabase(join(await getDatabasesPath(), "database.db"));
    db = await openDatabase(
      join(await getDatabasesPath(), "database.db"),
      version: 1,
      onCreate: (db, version){
        var sql = "CREATE TABLE receipts (id INTEGER PRIMARY KEY, title TEXT, description TEXT, dateAdded TEXT, dateModified TEXT, dateOfReceipt TEXT, amount REAL, comments TEXT, fileId INTEGER, type TEXT)";
        db.execute(sql);

        //sql = "ALTER TABLE receipts ADD COLUMN type TEXT";

        sql = "CREATE TABLE files (id INTEGER PRIMARY KEY, bytes BLOB, dateAdded DATETIME, fileName DATETIME)";
        db.execute(sql);

        //return;
      }
    );

    Connection.insertReceipt(Receipt(
      id: 1,
      title: "Title 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      dateOfReceipt: DateTime.now(),
      amount: 243.79,
      comments: "Pick n' Pay",
      type: ReceiptType.grocery,
    ));
    // Connection.insertReceipt(Receipt(
    //   id: 1,
    //   title: "Title 2",
    //   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //   dateAdded: DateTime.now(),
    //   dateModified: DateTime.now(),
    //   dateOfReceipt: DateTime.now().add(Duration(
    //       days: -3
    //   )),
    //   amount: 300.00,
    //   comments: "Sasol",
    //   type: ReceiptType.petrol,
    // ));
    // Connection.insertReceipt(Receipt(
    //   id: 1,
    //   title: "Title 3",
    //   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //   dateAdded: DateTime.now(),
    //   dateModified: DateTime.now(),
    //   dateOfReceipt: DateTime.now().add(Duration(
    //       days: -30,
    //       seconds: -50000
    //   )),
    //   amount: 700.00,
    //   comments: "Steam",
    //   type: ReceiptType.game,
    // ));
  }

  //region [ Receipts ]

  //insert Receipt
  static Future<void> insertReceipt(Receipt item) async{
    Database database = db;

    database.insert(
      'receipts',
      item.toMap()
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
        dateAdded: DateTime.parse(maps[i]['dateAdded']),
        dateModified: DateTime.parse(maps[i]['dateModified']),
        dateOfReceipt: DateTime.parse(maps[i]['dateOfReceipt']),
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