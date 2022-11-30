import 'dart:async';
import 'dart:io';
import 'package:contacts_application/model/contactmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  DbManager._();
  static final DbManager db = DbManager._();
  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  initDB() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), "main.db"),
      version: 1,
      onCreate: (
          db,
          int version,
          ) async {
        await db.execute(
          "CREATE TABLE Contacts(id INTEGER PRIMARY KEY autoincrement, "
              "user TEXT, "
              "phone TEXT,"
              "checkin TEXT)",
        );
      },
    );
    return database;
  }
  Future<void> insertContacts(Contacts contacts) async {

    final db = await database;
    await db.insert(
      'contacts',
      contacts.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Added: " + contacts.toString());
  }
  Future<List<Contacts>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) {
      return Contacts(
        id: maps[i]['id'],
        user: maps[i]['user'],
        phone: maps[i]['phone'],
        checkin: maps[i]['checkin'],
      );
    });
  }
}
