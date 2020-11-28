import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/views/reservations/create_reservation.dart';

import 'detail_office.dart';

/*

* Es una pagina que te permite buscar reservaciones en la pagina. Cuenta con una barra de busqueda y distintos:
*  precio ,distrito, calificacion,  proximidad.
*
* */


class ReservationListPage extends StatefulWidget {
  @override
  _ReservationListPageState createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  List reservations;

  Future<String> getReservationRequest() async {
    var response = await http.get(Uri.encodeFull(API.GET_OFFICES_URL),
        headers: API.DEFAULT_HEADERS);
    //print(response);
    setState(() {
      reservations = json.decode(response.body);
    });
    print('hola');
    print(response.body);
    print('ffffffffffffff');
    print(reservations);
  }

  @override
  void initState() {
    this.getReservationRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resrvaciones"),
        ),
        body: ListView.builder(
          itemCount: reservations == null ? 0 : reservations.length,
          itemBuilder: (BuildContext context, i) {
            return Card(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.shutterstock.com/image-vector/post-reservation-icon-simple-illustration-600w-720113797.jpg'),
                    ),
                    title: Text(reservations[i]['address'].toString().toUpperCase() +
                        ' - Por S/.' +
                        reservations[i]['price'].toString()),
                    subtitle: Text(reservations[i]['description']),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute(
                              builder: (context) =>
                                  OfficeDetailPage(reservations[i])));
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
                                  builder: (context) =>
                                      OfficeDetailPage(reservations[i])));
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
