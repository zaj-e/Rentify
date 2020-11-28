import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/views/reservations/create_reservation.dart';

import 'detail_office.dart';

/*
*
*
*
*
*
*
* Es una pagina que te permite buscar oficinas en la pagina. Cuenta con una barra de busqueda y distintos:
*  precio ,distrito, calificacion,  proximidad.
*
*
* */

class OfficeListPage extends StatefulWidget {
  @override
  OfficeListPageState createState() => OfficeListPageState();
}

class OfficeListPageState extends State<OfficeListPage> {
  List offices;

  Future<String> getOfficeRequest() async {
    var response = await http.get(API.GET_MY_OFFICES_URL);
    print(response.body);
    setState(() {
      offices = json.decode(response.body);
    });
    print('hola');
    print(response.body);
    print('ffffffffffffff');
    print(offices);
  }

  @override
  void initState() {
    this.getOfficeRequest();
  }

  @override
  Widget build(BuildContext context) {
    this.getOfficeRequest();

    return Scaffold(
        appBar: AppBar(
          title: Text('Office List'),
        ),
        body: ListView.builder(
          itemCount: offices == null ? 0 : offices.length,
          itemBuilder: (BuildContext context, i) {
            return Card(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.shutterstock.com/image-vector/post-office-icon-simple-illustration-600w-720113797.jpg'),
                    ),
                    title: Text(offices[i]['address'].toString().toUpperCase() +
                        ' - Por S/.' +
                        offices[i]['price'].toString()),
                    subtitle: Text(offices[i]['description']),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute(
                              builder: (context) =>
                                  OfficeDetailPage(offices[i])));
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
                                      OfficeDetailPage(offices[i])));
                        },
                      ),
                      TextButton(
                        child: Text('RESERVAR'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                              new CupertinoPageRoute(
                                  builder: (context) =>
                                      CreateReservationPage()));
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
