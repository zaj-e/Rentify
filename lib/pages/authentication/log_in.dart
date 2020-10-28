import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text('Login page')),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('authentication/log_in');
          },
          child: AspectRatio(
            aspectRatio: 3 / 1,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.blue,
                  child: Text('Login'),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed('authentication/register');
          },
          child: AspectRatio(
            aspectRatio: 3 / 1,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Text('Register'),
                  color: Colors.blue,
                )),
          ),
        )
      ],
    );
  }
}
