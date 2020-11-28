import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text(
            'Es una pagina donde puedes ver highlight de oficinas, como la pagina principal de la tienda de steam. Tiene seccion de oficinas mejor calificadas, mas populares, etc.'),
      ),
    );
  }
}
