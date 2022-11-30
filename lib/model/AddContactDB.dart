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
              "check-in TEXT)",
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
  // Future<List<LoginCredentials>> getLogin() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('Login');
  //   return List.generate(maps.length, (i) {
  //     return LoginCredentials(
  //       id: maps[0]['id'],
  //       Username: maps[0]['Username'],
  //       Password: maps[0]['Password'],
  //     );
  //   });
  // }
}
