import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailAccountPage extends StatefulWidget {
  @override
  _DetailAccountPage createState() => _DetailAccountPage();
}

class _DetailAccountPage extends State<DetailAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text(
            'Es una pagina donde puedes ver el detalle de tu cuenta, al fondo tiene un boton <Borrar>, borrar tiene su alert dialog'),
      ),
    );
  }
}
