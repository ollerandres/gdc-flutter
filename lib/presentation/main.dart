import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgcordobaflutter/bloc/search/bloc.dart';
import 'package:gdgcordobaflutter/data/clients/github_client.dart';
import 'package:gdgcordobaflutter/data/followers/github_repository.dart';
import 'file:///D:/AndroidStudioProjects/gdc_flutter/lib/presentation/home/home_screen.dart';
import 'file:///D:/AndroidStudioProjects/gdc_flutter/lib/presentation/utils/string_provider.dart';
import 'package:meta/meta.dart';

void main() {
  final GithubRepository _githubRepository = GithubRepository(GithubClient());
  runApp(GDDCordobaFlutterApp(githubRepository: _githubRepository));
}

class GDDCordobaFlutterApp extends StatelessWidget {
  final GithubRepository githubRepository;

  const GDDCordobaFlutterApp({
    Key key,
    @required this.githubRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = StringProvider.appTitle;
    final _home = HomeScreen();
    final blocProvider = BlocProvider(
        create: (context) => SearchBloc(githubRepository: githubRepository),
        child: _home);

    if (Platform.isIOS) {
      return CupertinoApp(
          title: _title,
          theme: CupertinoThemeData(primaryColor: Colors.green),
          home: CupertinoPageScaffold(
              child: blocProvider,
              navigationBar: CupertinoNavigationBar(
                middle: Text(_title),
              )));
    } else {
      return MaterialApp(
        title: _title,
        theme: ThemeData(primaryColor: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            title: Text(StringProvider.appTitle),
          ),
          body: blocProvider,
        ),
      );
    }
  }
}