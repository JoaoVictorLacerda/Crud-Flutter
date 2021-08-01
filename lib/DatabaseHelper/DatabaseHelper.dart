import 'dart:async';
import 'dart:io';
import 'package:crud_project_v1/models/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{

  //database instance
  //info database

  final String listaTable = 'lista';
  final String nome = 'name';
  final String email = 'email';
  final String avatar = 'avatar';



  static DatabaseHelper _instance= DatabaseHelper._internal();
  DatabaseHelper._internal();

  static late Database _database;

  factory DatabaseHelper(){
    return _instance;
  }


  Future<Database> get database async{
      _database =await initializeDatabase();

    return  _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path  = directory.path + 'list.db';

    var listaDatabase = await openDatabase(
        path,
        version: 1,
        onCreate: _createDb

    );
    return listaDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $listaTable($nome TEXT PRIMARY KEY, $email TEXT, $avatar TEXT )');
  }

  //incluir
  Future<int> insertUser(User user) async{
    Database db = await this.database; // método get

    var resultado = await db.insert(listaTable, user.toMap());
    return resultado;
  }
  //retorna uma lista de users
  Future<List<User>> getUsers() async{
    Database db = await this.database; //métodk get
    List<Map> listaDb= await db.query(this.listaTable);
    List<User> resultado =[];
    if(listaDb !=null){
      for(Map map in listaDb){
        resultado.add(User.fromMap(map));
      }
    }else{
      resultado.add(new User("Teste2", "PrimeiroEmail", "teste"));
    }
    return resultado;
  }

  // atualiza User
  Future<int> updateUser(User user) async{
    Database db = await this.database; // método get

    var resultado = await db.rawUpdate('''
    UPDATE $listaTable
    SET $nome = ?, $email = ?, $avatar = ?
    WHERE $email = ?
    ''',[user.name,user.email,user.avatarUrl, user.email]);

    return resultado;
  }

  //exclui User
  Future<int> deleteUser(String emaile) async{
    Database db = await this.database; //método get

    var resultado =
      await db.delete(
          this.listaTable,
          where: '$email = ?',
          whereArgs: [emaile]
      );
    return resultado;
  }

  Future close() async{
    Database db = await this.database; //método get
    db.close();
  }

}