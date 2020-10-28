import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onRegisterComplete;
  const RegisterPage({this.onRegisterComplete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text('Register page')),
        GestureDetector(
          onTap: onRegisterComplete,
          child: AspectRatio(
            aspectRatio: 3 / 1,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.blue,
                  child: Text('Register'),
                )),
          ),
        ),
      ],
    );
  }
}
