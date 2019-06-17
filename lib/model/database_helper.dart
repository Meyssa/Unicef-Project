import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unicef/model/player.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "myDatabase.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Players ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "score INTEGER"
          ")");
    });
  }

  newPlayer(Player newPlayer) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Players");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Players (id,name,score)"
        " VALUES (?,?,?)",
        [
          id,
          newPlayer.name,
          newPlayer.score,
        ]);
    return id;
  }

  Future<Player> updatePlayer(Player newPlayer) async {
    final db = await database;
    var res = await db.update("Players", newPlayer.toMap(),
        where: "id = ?", whereArgs: [newPlayer.id]);
    print(newPlayer.score);
    return newPlayer;
  }

  getPlayer(int id) async {
    final db = await database;
    var res = await db.query("Players", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Player.fromMap(res.first) : null;
  }

  Future<List<Player>> getAllPlayers() async {
    final db = await database;
    var res = await db.query("Players");
    List<Player> list =
        res.isNotEmpty ? res.map((c) => Player.fromMap(c)).toList() : [];
    return list;
  }

  deletePlayer(int id) async {
    final db = await database;
    return db.delete("Players", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.delete("Players");
  }
}
