import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';

class DateOption {
  DateTime selectedDate;
  DateTime now;
  DateOption(this.selectedDate, this.now);

  DateTime picked;

  changeState() {
    selectedDate = picked;
  }

  Future<bool> setDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: now,
      lastDate: now.add(new Duration(days: 120)),
    );
    if (picked != null && picked != selectedDate) {
      return true;
    }
    return false;
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
  DateTime now = DateTime.now();

  DateOption start;
  DateOption end;

  _CreateReservationPageState() {
    this.start = new DateOption(this.selectedDate, now);
    this.end = new DateOption(this.selectedDate.add(Duration(days: 120)),
        now.add(Duration(days: 60)));
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
            Container(
              child: ElevatedButton(
                  child: Text("Starting: ${start.selectedDate.day.toString()}/"
                      "${start.selectedDate.month.toString()}/"
                      "${start.selectedDate.year.toString()}"),
                  onPressed: () async {
                    await start.setDate(context).then((value) {
                      if (value) {
                        setState(() {
                          start.changeState();
                        });
                      }
                    });
                  }),
              width: double.infinity,
            ),
            Container(
              child: ElevatedButton(
                  child: Text("Ending: ${end.selectedDate.day.toString()}/"
                      "${end.selectedDate.month.toString()}/"
                      "${end.selectedDate.year.toString()}"),
                  onPressed: () async {
                    await end.setDate(context).then((value) {
                      if (value) {
                        setState(() {
                          end.changeState();
                        });
                      }
                    });
                  }),
              width: double.infinity,
            ),
            Container(
              width: 330,
              height: 200,
              child: Card(
                color: Color.fromRGBO(23, 137, 205, 100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 42,
                              ),
                              Align(
                                child: Icon(
                                  CupertinoIcons.rectangle_split_3x3_fill,
                                  size: 42,
                                  color: Colors.amber,
                                ),
                                alignment: Alignment.bottomLeft,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Text('Your bank name'))
                      ],
                    ),
                    Expanded(
                      child: Align(
                        child: Text(
                          '400    1234    5678    90**',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Credit',
                              color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Text(
                              'Valid From',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                            title: Text(
                              '01/12',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Text(
                              'Good Thru',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                            title: Text(
                              '31/15',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        child: Text(
                          'RICKY GUTIERREZ',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Credit',
                              color: Colors.white),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Confirm Reservation'),
              ),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
