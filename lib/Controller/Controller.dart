import 'package:crud_project_v1/DatabaseHelper/DatabaseHelper.dart';
import 'package:crud_project_v1/models/User.dart';
import 'package:flutter/cupertino.dart';


class ControllerProject{

  final DatabaseHelper db = new  DatabaseHelper();
  static late ControllerProject _instance= ControllerProject._internal();

  ControllerProject._internal();

  factory ControllerProject(){
    return _instance;
  }

  void insertUser(User user) async{
    await db.insertUser(user);
    _notificarListeners();
  }

  Future<List<User>> getListaDeUsers() async{
    List<User> lista = await db.getUsers();
    return lista;
  }

  void deleteUser(String email) async {
    await db.deleteUser(email);
    _notificarListeners();
  }

  void updateUser(User user)async{
    await db.updateUser(user);
    _notificarListeners();
  }

  void _notificarListeners(){
    new ChangeNotifier().notifyListeners();
  }

}