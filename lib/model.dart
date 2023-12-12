import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

typedef Mapp = Map<String, dynamic>;

class DbHelper {
  Database? database;
  void create(Database database) async {
    await database.execute('''
      CREATE TABLE Dhairya (
        ID INTEGER PRIMARY KEY,
        NAME TEXT
      )
    ''');
  }

  Future<void> initdb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'my.db');
    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        create(db);
      },
    );
  }

  read() async {
    if (database == null) await initdb();
    return await database?.query('Dhairya');
  }

  insert(Mapp data) async {
    if (database == null) await initdb();
    return await database?.insert('Dhairya', data);
  }

  update(int id, Mapp data) async {
    if (database == null) await initdb();
    return await database
        ?.update('Dhairya', data, where: 'ID = ?', whereArgs: [id]);
  }

  delete(int id) async {
    if (database == null) await initdb();
    return await database?.delete('Dhairya', where: 'ID = ?', whereArgs: [id]);
  }
}
