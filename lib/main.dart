import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/views/create_reservation.dart';
import 'package:rentify/views/offices.dart';
import './navigation/router.dart';

void main() async {
  runApp(MyApp(initRoute: '/app'));
}

class MyApp extends StatelessWidget {
  String initRoute;

  MyApp({@required this.initRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RENTIFY',
      initialRoute: this.initRoute,
      routes: <String, WidgetBuilder>{
        //'/authentication': (BuildContext context) => AuthenticationApp(),
        '/app': (BuildContext context) => AppRouter(),
        '/create_reservation': (BuildContext context) =>
            CreateReservationPage(),
        '/offices': (BuildContext context)=>
            Offices(),
      },
    );
  }
}
