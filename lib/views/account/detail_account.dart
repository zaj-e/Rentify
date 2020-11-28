import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/constants/api.dart';
import 'package:rentify/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/views/account/edit_detail_account.dart';

class DetailAccountPage extends StatefulWidget {
  @override
  _DetailAccountPage createState() => _DetailAccountPage();
}

class _DetailAccountPage extends State<DetailAccountPage> {
  User user;
  Future<String> getUserRequest() async {
    var response = await http.get(Uri.encodeFull(API.USER_URL),
        headers: API.DEFAULT_HEADERS);
    //print(response);
    setState(() {
      user = json.decode(response.body);
    });
    //print(response.body);
  }

  @override
  void initState(){
    this.getUserRequest();
  }


  Widget _blueColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.blue,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("User information:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //Text(user.name.toString()),
                  Text("Juan"),
                  SizedBox(
                    width: 20,
                  ),
                  //Text(user.lastname.toString()),
                  Text("Caceda Mercedez"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Email:"),
                  SizedBox(
                    width: 20,
                  ),
                  //Text(user.email.toString()),
                  Text("usuario@gmail.com")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userAdress() {
    return Positioned(
      top: 380,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Identification:"),
                  SizedBox(
                    width: 10,
                  ),
                  //Text(user.identification.toString()),
                  Text("5465464")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Phone:"),
                  SizedBox(
                    width: 10,
                  ),
                  //Text(user.phone.toString()),
                  Text("9999999999")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Province:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Vietiane capital"),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: Text('Editar'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute(
                                builder: (context) =>
                                    EditDetailAccountPage()));
                      },
                    ),
                    SizedBox(width: 8),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _blueColors(),
            _getInfo(),
            _userAdress(),
          ],
        ),
      ),
    );
  }
}
