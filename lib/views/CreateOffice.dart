import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateOffice extends StatefulWidget {
  @override
  _CreateOfficeState createState() => _CreateOfficeState();
}

class _CreateOfficeState extends State<CreateOffice> {
  final formKey = GlobalKey<FormState>();
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
                    onPressed: () {},
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
