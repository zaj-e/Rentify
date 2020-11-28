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
              Text("Nombre"),
          TextField(
            onChanged: (name) {
              print("Nombre: $name");
            },
          ),
              Text("Email"),
          TextField(
            onChanged: (email) {
              print("Email: $email");
            },
          ),
              Text("Usuario"),
          TextField(
            onChanged: (user) {
              print("Usuario: $user");
            },
          ),
              Text("Contraseña"),
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
