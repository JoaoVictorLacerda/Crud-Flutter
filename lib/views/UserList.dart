import 'package:crud_project_v1/Controller/Controller.dart';
import 'package:crud_project_v1/componentes/UserTile.dart';
import 'package:crud_project_v1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormularioAddUser.dart';



class UserList extends StatefulWidget {

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ControllerProject _controller = new ControllerProject();
  List<User> _users = [];

  Widget homePage(BuildContext context, List<User> lista){
    return  new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text("Lista de usuários"),
        ),

      ),
      body: ListView.builder(
          itemCount: lista.length,
          itemBuilder:(ctx, i) => new UserTile(lista.asMap().values.elementAt(i))
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => new FormularioAddUser())
          );
        },
        child: new Icon(Icons.add),

      ),
    );
  }

  @override
  void initState(){
    super.initState();

    _controller.getListaDeUsers().then((list){
      setState(() {
        this._users=list;
      });
    });



  }


  @override
  Widget build(BuildContext context) {

    return this.homePage(context, _users);
  }
}

