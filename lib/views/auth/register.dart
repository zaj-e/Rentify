import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _CreateRegisterState createState() => _CreateRegisterState();
}

class _CreateRegisterState extends State<Register> {
  String name = '';
  String email = '';
  String user = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          TextField(
            onChanged: (name) {
              print("Nombre: $name");
            },
          ),
          TextField(
            onChanged: (email) {
              print("Email: $email");
            },
          ),
          TextField(
            onChanged: (user) {
              print("Usuario: $user");
            },
          ),
          TextField(
            onChanged: (password) {
              print("Contraseña: $password");
            },
          ),
          ElevatedButton(
            child: Text('Create'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ])),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.login),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
    );
    // TODO: implement createState
    throw UnimplementedError();
  }
}
