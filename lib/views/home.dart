import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/views/create_reservation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text('Book Office'),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
              new CupertinoPageRoute(
                  builder: (context) => CreateReservationPage()));
        },
      ),
    );
  }
}
