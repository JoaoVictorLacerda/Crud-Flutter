import 'package:crud_project_v1/views/UserList.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new UserList(),
    );
  }
}