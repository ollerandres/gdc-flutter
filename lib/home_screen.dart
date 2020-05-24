import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdgcordobaflutter/Follower.dart';
import 'package:http/http.dart' as http;

import 'strings.dart';

class HomeScreenState extends State<HomeScreen> {
  var _followers = <Follower>[];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(Strings.appTitle),
        ),
        child: _screenBody(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(Strings.appTitle),
        ),
        body: _screenBody(),
      );
    }
  }

  Widget _screenBody() {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(24.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Followers de andevcba",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'SourceSansPro',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800)),
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: _followers.length,
                    itemBuilder: (BuildContext context, int position) {
                      return _buildRow(position);
                    }))
          ]),
    );
  }

  Widget _buildRow(int i) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text("${_followers[i].login}",
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.w800)),
        leading: CircleAvatar(
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage(_followers[i].avatar_url)),
      ),
    );
  }

  _loadData() async {
    String dataURL = "https://api.github.com/users/andevcba/followers";
    http.Response response = await http.get(dataURL);
    setState(() {
      final usersJson = json.decode(response.body);

      for (var userJson in usersJson) {
        final user = Follower.fromJson(userJson);
        _followers.add(user);
      }
    });
  }
}

class HomeScreen extends StatefulWidget {
  @override
  createState() => HomeScreenState();
}
