import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditDetailAccountPage extends StatefulWidget {
  @override
  _EditDetailAccountPage createState() => _EditDetailAccountPage();
}

class _EditDetailAccountPage extends State<EditDetailAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text(
            'Es una pagina con campos editables, aqui puedes actualizar datos de una tu cuenta, con un boton al final de "Update" y "Cancel"'),
      ),
    );
  }
}
