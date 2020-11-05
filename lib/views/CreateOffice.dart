import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/models/office.dart';

class CreateOffice extends StatefulWidget {
  @override
  _CreateOfficeState createState() => _CreateOfficeState();
}
Future<Office> createOffice(String nombre,String descripcion,String correo,String telefono,String tarifa) async{
  final String apiurl = 'rentifyAPI';
  final response = await http.post(apiurl,body: {
    "nombre":nombre,
    "descripcion":descripcion,
    "correo":correo,
    "telefono":telefono,
    "tarifa":tarifa
  });
  
  return jsonDecode(response.body);
}
class _CreateOfficeState extends State<CreateOffice> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController tarifaController = TextEditingController();

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
              leading: BackButton(),
              title: Text('Create Office'),
              centerTitle: true,
              backgroundColor: Colors.teal,
            ),
            Form(
              key: formKey,
              child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    onPressed: () {
                      final String nombre = nombreController.text;
                      final String descripcion = descripcionController.text;
                      final String correo = correoController.text;
                      final String telefono = telefonoController.text;
                      final String tarifa = tarifaController.text;

                      final Office oficina = await createOffice(nombre, descripcion, correo, telefono, tarifa);

                      setState(() {

                      });
                    },
                    child: const Text('Publicar'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(hintText: 'Nombre'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descripcionController,
                  decoration: const InputDecoration(hintText: 'Descripcion'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: correoController,
                  decoration: const InputDecoration(hintText: 'Correo'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: telefonoController,
                  decoration: const InputDecoration(hintText: 'Telefono'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: tarifaController,
                  decoration: const InputDecoration(hintText: 'Tarifa'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
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
