import 'package:crud_project_v1/models/User.dart';
import 'package:crud_project_v1/views/DeleteUser.dart';
import 'package:crud_project_v1/views/UpdateUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class UserTile extends StatelessWidget {
  final User _user;

  const UserTile(this._user);

  @override
  Widget build(BuildContext context) {
    CircleAvatar avatar;

    if (Uri.tryParse(_user.avatarUrl)!.isAbsolute) {
      avatar =
      new CircleAvatar(backgroundImage: new NetworkImage(_user.avatarUrl));
    } else {
      avatar = new CircleAvatar(child: new Icon(Icons.person));
    }
    return ListTile(
        leading: avatar,
        title: new Text(_user.name),
        subtitle: new Text(_user.email),
        trailing: new Container(
          width: 100,
          child:
          Row(
            children: [
              new IconButton(
                  onPressed: () {

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => new UpdateUser(_user.name, _user.email, _user.avatarUrl))
                    );
                  },
                  icon: new Icon(Icons.edit, color: Colors.green)),

              new IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => new DeleteUser(_user.name, _user.email))
                    );
                  },
                  icon: new Icon(Icons.delete, color: Colors.red))
            ],
          ),
        )
    );
  }

}

