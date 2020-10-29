import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}
