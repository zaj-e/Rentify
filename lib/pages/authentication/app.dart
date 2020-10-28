import 'package:auth_test/pages/authentication/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'log_in.dart';

class AuthenticationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'authentication/log_in',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'authentication/log_in':
            builder = (BuildContext _) => LogInPage();
            break;
          case 'authentication/register':
            builder = (BuildContext _) => RegisterPage(
                  onRegisterComplete: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/app');
                  },
                );
            break;
          default:
            throw Exception('Invalid route ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
