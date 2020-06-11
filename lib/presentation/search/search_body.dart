import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgcordobaflutter/bloc/search/bloc.dart';
import 'package:gdgcordobaflutter/presentation/search/search.dart';
import 'file:///D:/AndroidStudioProjects/gdc_flutter/lib/presentation/utils/string_provider.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: BlocProvider.of<SearchBloc>(context),
      builder: (BuildContext context, SearchState state) {
        if (state is SearchStateEmpty) {
          return Text(StringProvider.insertUserToSearch,
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w800));
        }
        if (state is SearchStateLoading) {
          return CircularProgressIndicator();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? Text(StringProvider.noResults,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w800))
              : Expanded(child: SearchResults(items: state.items));
        }
        return Text(StringProvider.error,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.red,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.w800));
      },
    );
  }
}
