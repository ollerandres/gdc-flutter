import 'dart:async';
import 'dart:convert';

import 'package:gdgcordobaflutter/data/followers/search_result.dart';
import 'package:gdgcordobaflutter/data/followers/search_result_error.dart';
import 'package:http/http.dart';

class GithubClient {
  final String baseUrl;
  final Client httpClient;

  GithubClient({
    Client httpClient,
    this.baseUrl = "https://api.github.com/users",
  }) : this.httpClient = httpClient ?? Client();

  Future<SearchResult> search(String username) async {
    final response =
        await httpClient.get(Uri.parse("$baseUrl/$username/followers"));
    final result = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(result);
    } else {
      throw SearchResultError.fromJson(result);
    }
  }
}
