import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgcordobaflutter/bloc/search/bloc.dart';
import 'file:///D:/AndroidStudioProjects/gdc_flutter/lib/presentation/utils/string_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        _searchBloc.add(
          TextChanged(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: _onClearTapped,
        ),
        border: InputBorder.none,
        hintText: StringProvider.searchHint,
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = StringProvider.empty;
    _searchBloc.add(TextChanged(text: StringProvider.empty));
  }
}
