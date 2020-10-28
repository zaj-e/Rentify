import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> exchange() async {
    FlutterAppAuth appAuth = FlutterAppAuth();
    // OpenID connect discovery
    final AuthorizationTokenResponse result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        'interactive.public',
        'io.identityserver.demo:/oauthredirect',
        discoveryUrl:
            'https://demo.identityserver.io/.well-known/openid-configuration',
        scopes: ['openid', 'profile', 'email', 'offline_access', 'api'],
      ),
    );
    String prnt = result.idToken;

    print('This is the result: $prnt.');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Home Page'),
        onPressed: exchange,
      ),
    );
  }
}
