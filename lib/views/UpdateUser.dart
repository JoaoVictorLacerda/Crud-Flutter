import 'package:crud_project_v1/Controller/Controller.dart';
import 'package:crud_project_v1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserList.dart';

class UpdateUser extends StatelessWidget {
  String _nome='';
  String _email='';
  String _img='';
  UpdateUser(String nome, String email, String img){
    this._nome=nome;
    this._email=email;
    this._img=img;
  }

  final ControllerProject _controller = new ControllerProject();

  String _escolha(int esc){
    if(esc==1){
      return _nome;
    }else if(esc==2){
      return _email;
    }else{
      return _img;
    }
  }


  Widget _campos(int esc, String dado){
    return new TextFormField(
      initialValue: this._escolha(esc),
      onChanged: (text) {
        if(esc==1){
          _nome = text;
        }else if(esc==2){
          _email = text;
        }else{
          _img = text;
        }
      },
      decoration: new InputDecoration(
          labelText: dado,
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(30)
          )
      ),
    );
  }


  Widget _addBotao(BuildContext context){
    return new IconButton(
      icon: new Icon( Icons.update),
      iconSize: 50,
      color: Colors.black,
      onPressed: () {
        if(_nome==''||_email=='' ){
          print("Operação cancelada");
        }else{
          User user = new User(_nome, _email, _img);
          _controller.updateUser(user);
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => new UserList()));
      },
    );
  }


  Widget _espaco(){
    return new Container(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text("Atualizar usuário"),
        ),
      ),
      body: new SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,

            height: MediaQuery.of(context).size.height,
            child: new Padding(
                padding: const EdgeInsets.all(14.0),
                child: new Form(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Icon(
                        Icons.person,
                        size: 200,),
                      _campos(1, "Nome"),
                      _espaco(),
                      _campos(2, "Email"),
                      _espaco(),
                      _campos(3, "Avatar"),
                      _espaco(),
                      _addBotao(context)
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}