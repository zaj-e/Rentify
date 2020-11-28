import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OfficeMini {
  String title;
  String url;
  int id;

  OfficeMini.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    id = json['id'];
  }
}

class Item extends StatelessWidget {
  String url, title;
  int id;
  Item({this.url, this.title, this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(children: [
        Image.network(this.url),
        Text(this.title),
      ]),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> litems = new List<Widget>();
  List t;
  List<OfficeMini> officeMinis;

  List<String> Extract() {
    List<String> ls = new List<String>();
    for (int i = 0; i < officeMinis.length; i++) {
      ls.add(officeMinis[i].title);
    }
  }

  _HomePageState() {
    var url = 'http://10.0.2.2:5001/api/offices';
    http.get(url).then((value) {
      // print(value.body);
      t = json.decode(value.body);
      officeMinis = t.map((o) => OfficeMini.fromJson(o)).toList();
      print(officeMinis);

      for (int i = 0; i < officeMinis.length; i++) {
        String url = officeMinis[i].url;
        String title = officeMinis[i].title;
        int id = officeMinis[i].id;
        litems.add(new Item(
          url: url,
          title: title,
          id: id,
        ));
      }
      // litems =
      //     officeMinis.map((e) => new Item(url: e.url, title: e.title)).toList();
      // print(litems.elementAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(Extract()));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: new GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: litems,
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
