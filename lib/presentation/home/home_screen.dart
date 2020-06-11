
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdgcordobaflutter/presentation/search/search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[SearchBar(), SearchBody()],
    );
  }
}