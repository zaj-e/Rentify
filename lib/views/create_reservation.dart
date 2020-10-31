import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';
import 'package:rentify/models/reservation.dart';

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
  final Office office;
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  DateOption start;
  DateOption end;
  Reservation reservation;

  _CreateReservationPageState({this.office}) {
    this.start = new DateOption(this.selectedDate, now);
    this.end = new DateOption(this.selectedDate.add(Duration(days: 120)),
        now.add(Duration(days: 60)));
  }

  double getOfficeMonthlyPrice() {
    if (this.office == null) {
      return 200;
    }
    return this.office.price;
  }

  int reservationDurationInDays() {
    return end.selectedDate.difference(start.selectedDate).inDays;
  }

  int reservationDurationInMonths() {
    return end.selectedDate.difference(start.selectedDate).inDays ~/ 30;
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
              backgroundColor: Colors.teal,
            ),
            Container(
              child: RaisedButton(
                  // color: Colors.black,
                  // textColor: Colors.white,
                  child: Text(
                      "Fecha inicial: ${start.selectedDate.day.toString()}/"
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
              child: RaisedButton(
                  // color: Colors.black,
                  // textColor: Colors.white,
                  child: Text("Fecha final: ${end.selectedDate.day.toString()}/"
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
                // color: Color.fromRGBO(23, 137, 205, 100),
                color: Colors.black54,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 36,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'YOUR BILLING',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14,
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
                              'VALID FROM',
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
                              'GOOD THRU',
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
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            child: Text(
                              'RICKY GUTIERREZ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Credit',
                                  color: Colors.white),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Datos de reserva',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 24.0, right: 0.0),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '- Duracion: ${reservationDurationInMonths()} meses (${reservationDurationInDays()} dias)',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 24.0, right: 0.0),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '- Precio mensual: \$${getOfficeMonthlyPrice()}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 24.0, right: 0.0),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '- Total a pagar: \$${getOfficeMonthlyPrice() * reservationDurationInMonths()}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints.expand(),
                child: RaisedButton(
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('Confirm Reservation'),
                  onPressed: () {
                    int officeId = office.id ?? 100;
                    reservation = Reservation(
                        initialDate: start.selectedDate,
                        endDate: end.selectedDate,
                        officeId: officeId,
                        accountId: 1);
                    print(officeId);
                  },
                ),
              ),
              // width: double.infinity,
              // height: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
