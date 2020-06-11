import 'dart:async';

import 'package:gdgcordobaflutter/data/clients/github_client.dart';
import 'package:gdgcordobaflutter/data/followers/search_result.dart';

class GithubRepository {
  final GithubClient client;

  GithubRepository(this.client);

  Future<SearchResult> search(String term) async {
    return client.search(term);
  }
}
