import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Offices extends StatefulWidget {
  @override
  _OfficesState createState() => _OfficesState();
}

class _OfficesState extends State<Offices> {
  String url = 'https://rentifyupc.azurewebsites.net/api/offices';
  List data;

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {'Accept': 'aplication/json'});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['results'];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Office List!!!'),
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i) {
            return ListTile(
              title: Text(data[i]['address']),
              subtitle: Text(data[0]['description']['capacity']['price']),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfficeDetails(data[i])));
              },
            );
          },
        )
    );
  }
}

class OfficeDetails extends StatelessWidget {
  final value;
  OfficeDetails(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Office Detail'),
      ),
      body: Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(value['picture']['large']),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              border: Border.all(
                  color: Colors.teal,
                  width: 4.0
              )
          ),
        ),
      ),
    );
  }
}
