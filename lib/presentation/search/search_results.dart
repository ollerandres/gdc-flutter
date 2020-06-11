import 'package:flutter/widgets.dart';
import 'package:gdgcordobaflutter/data/followers/follower.dart';
import 'package:gdgcordobaflutter/presentation/search/search_result_item.dart';

class SearchResults extends StatelessWidget {
  final List<Follower> items;

  const SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SearchResultItem(follower: items[index]);
      },
    );
  }
}
