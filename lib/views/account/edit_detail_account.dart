import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/constants/api.dart';
import 'package:rentify/models/user.dart';

class EditDetailAccountPage extends StatefulWidget {
  @override
  _EditDetailAccountPage createState() => _EditDetailAccountPage();
}

Future<User>updateUser(String email,String identification,String name,String lastname, String phone )async{

  final response = await http.put(API.USER_URL, body: {
    "email":email,
    "identification":identification,
    "name":name,
    "lastname":lastname,
    "phone":phone
  });
  return jsonDecode(response.body);
}

class _EditDetailAccountPage extends State<EditDetailAccountPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController  emailController= TextEditingController();
  final TextEditingController  identificationController= TextEditingController();
  final TextEditingController  nameController= TextEditingController();
  final TextEditingController  lastnameController= TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              title: Text('Update UserProfile'),
            ),
            Form(
              key: formKey,
              child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    onPressed: () async {
                      final String email = emailController.text;
                      final String identification = identificationController.text;
                      final String name = nameController.text;
                      final String lastname = lastnameController.text;
                      final String phone = phoneController.text;

                      final User user = await updateUser(
                          email,identification,name,lastname,phone,);

                      setState(() {});
                    },
                    child: const Text('Actualizar'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Nombre'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lastnameController,
                  decoration: const InputDecoration(hintText: 'Apellidos'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your lastname';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: identificationController,
                  decoration: const InputDecoration(hintText: 'Identificacion'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter yor ID';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(hintText: 'Telefono'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
