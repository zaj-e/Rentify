import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';

class CreateReservationPage extends StatefulWidget {
  final Office office;
  CreateReservationPage({this.office});
  @override
  _CreateReservationPageState createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              leading: BackButton(),
              title: Text('Create Reservation'),
              centerTitle: true,
            ),
            Center(
              child: Text('Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
