import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'strings.dart';

void main() => runApp(GDDCordobaFlutterApp());

class GDDCordobaFlutterApp extends StatelessWidget {
  String _title = Strings.appTitle;
  StatefulWidget _home = HomeScreen();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: _title,
        theme: CupertinoThemeData(primaryColor: Colors.white),
        home: _home,
      );
    } else {
      return MaterialApp(
        title: _title,
        theme: ThemeData(primaryColor: Colors.white),
        home: _home,
      );
    }
  }
}
