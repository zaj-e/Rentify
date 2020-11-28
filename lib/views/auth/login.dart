import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/navigation/router.dart';
import 'package:rentify/views/auth/register.dart';


import '../office/home.dart';

class Login extends StatefulWidget {
  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<Login> {
  String user = '';
  String password = '';
  String admin = 'admin';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text("Inicio de Sesion"),
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
            child: Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppRouter()),
              );
            },
          ),
        ])),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.app_registration),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
        ),
      ),
    );
    // TODO: implement createState
    throw UnimplementedError();
  }
}
