import 'package:crud_project_v1/Controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserList.dart';


class DeleteUser extends StatelessWidget {
  final String _user;
  final String _email;
  DeleteUser(this._user, this._email);

  final ControllerProject controller = new ControllerProject();

  void _navegacao(BuildContext context){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => new UserList() )
    );
  }
  void _notificaListeners(){
    new ChangeNotifier().notifyListeners();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text("Deletar usuário"),
          ),
        ),

        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Deletar usuário: $_user"),
              new Container(height: 20),
              new FlatButton(
                  onPressed: (){
                    controller.deleteUser(_email);
                    _notificaListeners();
                    _navegacao(context);

                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: new Text('Deletar Usuário')),
              new Container(height: 20),
              new FlatButton(
                  onPressed: (){_navegacao(context);},
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: new Text('      Cancelar      ')),

            ],
          ),
        )
    );
  }
}
