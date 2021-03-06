import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/constants/api.dart';
import 'package:http/http.dart' as http;

import '../../deprecated/detail_reservation.dart';

/*
*
*
* Es una pagina donde puedes ver las reservas que tu has realizado
* en distintas oficinas, a modo de card list. Tiene 2 secciones para
* ver reservas activas (aceptadas) e inactivas (canceladas o que ya
* terminaron).
*
*
* */

class ReservationListPage extends StatefulWidget {
  @override
  _ReservationListPageState createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  List reservations;
  List offices = [];

  Future<String> getReservationListRequest() async {
    var response = await http.get(Uri.encodeFull(API.GET_RESERVATION_LIST_URL),
        headers: {'Accept': 'application/json'});

    setState(() {
      reservations = json.decode(response.body);
      reservations.forEach((element) {
        getOfficeRequest(element['officeId'].toString());
      });
    });
  }

  Future<String> getOfficeRequest(String id) async {
    var response = await http.get(Uri.encodeFull(API.GET_OFFICE_URL + id),
        headers: API.DEFAULT_HEADERS);
    print(response);
    setState(() {
      offices.add(json.decode(response.body));
    });
  }

  @override
  void initState() {
    this.getReservationListRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mis reservas")),
        body: ListView.builder(
          itemCount: offices == null || offices.length == 0 ? 0 : offices.length,
          itemBuilder: (BuildContext context, i) {
            return /*ListTile(
            title: Text(reservations[i]['initialDate']),
            subtitle: Text(offices[i]['description'])
          );*/
                Card(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.shutterstock.com/image-vector/post-office-icon-simple-illustration-600w-720113797.jpg'),
                    ),
                    title: Text(reservations[i]['officeId'] != null ? offices[i]['address'].toString().toUpperCase() + ' - Por S/.' + offices[i]['price'].toString() : 'NO-OFFICE'),
                    subtitle: Text(reservations[i]['officeId']  != null ? offices[i]['description'] : 'NO-OFFICE-DESCRIPTION'),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute(
                              builder: (context) => ReservationDetailPage(
                                  reservations[i], offices[i])));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Text('DETALLE'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                              new CupertinoPageRoute(
                                  builder: (context) => ReservationDetailPage(
                                      reservations[i], offices[i])));
                        },
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
