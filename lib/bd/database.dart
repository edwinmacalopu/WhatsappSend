import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:whatsappsend/model/modelschat.dart';

class ManagerDatabaseProvider{
  ManagerDatabaseProvider._();
  static final ManagerDatabaseProvider db=ManagerDatabaseProvider._();
  Database _database;
  Future<Database> get database async{
    if (_database!=null)return _database;
    _database=await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=join(directory.path,"schat.db");
    return await openDatabase(path,version:1,
    onCreate: (Database db,int version) async{
       await db.execute("CREATE TABLE Schat ("
          "id integer primary key,"
          "nombre TEXT,"
          "numero TEXT,"
          "fecha TEXT"
          ")");
      });
    }

    Future<List<Manager>> getAllManager()async{
      final db=await database;
      var response=await db.query("Schat");
      List<Manager> list=response.reversed.map((c)=>Manager.fromMap(c)).toList();
      return list;
    }

    Future <Manager> getManagerWhitid(int id)async{
      final db=await database;
      var response=await db.query("Schat",where:"id= ?",whereArgs: [id]);
      return response.isNotEmpty?Manager.fromMap(response.first):null;
    }

    addManagerToDatabase(Manager manager)async{
      final db=await database;
      var table=await db.rawQuery("SELECT MAX(id)+1 as id FROM Schat");
      int id=table.first["id"];
  manager.id=id;
  var raw=await db.insert("Schat",
  manager.topMap(),
  conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return raw;
    }

    deleteManagerithId(int id)async{
      final db=await database;
      return db.delete("Schat",where:"id = ?",whereArgs: [id]);

    }

    updateManager(Manager manager)async{
      final db=await database;
      var response=await db.update("Schat",manager.topMap(),
      where: "id= ?",whereArgs: [manager.id]);
      return response;
    }
}