import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_itti/models/user_db.dart';


class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async =>  _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'UsersDB.db');
    print(path);
    
    

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version)async {

        await db.execute('''
          CREATE TABLE Users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            birth TEXT,
            sex TEXT
          )
        ''');

      }
    );
  }
  Future<List<UserDB>> getAllUsers() async {

    final db = await database;
    final res = await db.query('Users');

    return res.isNotEmpty ? res.map((e) => UserDB.fromMap(e)).toList() : [];
  }

  Future<UserDB?> getUserById(int id) async {

    final db =  await database;
    final res = await db.query('Users', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? UserDB.fromMap(res.first) : null;
  }

  

  Future<int> newUser(UserDB user) async {
    final db = await database;
    final res =  db.insert('Users', user.toMap());

    return res;
  }

  Future<int> updateUser( UserDB user) async {
    final db =  await database;
    final res = await db.update('Users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);

    return res;
  }

  Future<int> deleteUser(int id) async {
    final db =  await database;
    final res = await db.delete('Users',where: 'id = ?',whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllUsers() async {
    final db =  await database;
    final res = await db.delete('Users');

    return res;

  }
}

