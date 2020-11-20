import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:rentify/views/OfficeDetailPage.dart';


class OfficeListPage extends StatefulWidget{
  @override
  OfficeListPageState createState() => OfficeListPageState();
}

class OfficeListPageState extends State<OfficeListPage>{

  List offices;

  Future<String> getOfficeRequest() async {
    var response = await http.get(Uri.encodeFull(API.GET_OFFICES_URL),
        headers: API.DEFAULT_HEADERS
    );
    //print(response);
    setState(() {
      offices= json.decode(response.body);
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Oficinas"),
      ),
        body: ListView.builder(
          itemCount: offices == null ? 0 : offices.length,
          itemBuilder: (BuildContext context, i) {
            return
              Card(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/post-office-icon-simple-illustration-600w-720113797.jpg'),
                      ),
                      title: Text(offices[i]['address'].toString().toUpperCase() + ' - Por S/.' + offices[i]['price'].toString()),
                      subtitle: Text(offices[i]['description']),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute(
                                builder: (context) => OfficeDetailPage(offices[i])));
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
                                    builder: (context) => OfficeDetailPage(offices[i])));
                          },
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              );
          },
        )
    );
  }
}