import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';

class DateOption {
  DateTime selectedDate;
  DateTime now;
  DateOption(this.selectedDate, this.now);

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: now,
      lastDate: now.add(new Duration(days: 60)),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    // setState(() {
    //   selectedDate = picked;
    // });
  }
}

class CreateReservationPage extends StatefulWidget {
  final Office office;
  CreateReservationPage({this.office});
  @override
  _CreateReservationPageState createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  DateTime selectedDate = DateTime.now();
  final now = DateTime.now();

  final DateOption start = DateOption();

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: now,
      lastDate: now.add(new Duration(days: 60)),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
            RaisedButton(onPressed: () => _selectDate(context)),
            RaisedButton(onPressed: () => DateOption.setDate(context))
          ],
        ),
      ),
    );
  }
}
