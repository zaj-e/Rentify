import 'package:auth_test/pages/authentication/app.dart';
import 'package:auth_test/settings/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_test/pages/booking/router.dart';

void main() async {
//  if (await UserPreferences().isAuthenticated()) {
//    runApp(MyApp(
//      initRoute: '/app',
//    ));
//  } else {
//    runApp(MyApp(
//      initRoute: '/authentication',
//    ));
//  }
  runApp(MyApp(initRoute: '/app'));
}

class MyApp extends StatelessWidget {
  String initRoute;

  MyApp({@required this.initRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUTH-TEST',
      initialRoute: this.initRoute,
      routes: <String, WidgetBuilder>{
        '/authentication': (BuildContext context) => AuthenticationApp(),
        '/app': (BuildContext context) => AppRouter(),
      },
    );
  }
}
