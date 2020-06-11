import 'package:gdgcordobaflutter/data/followers/follower.dart';

class SearchResult {
  final List<Follower> users;

  const SearchResult({this.users});

  static SearchResult fromJson(List json) {
    final items = json.map((item) => Follower.fromJson(item)).toList();
    return SearchResult(users: items);
  }
}
