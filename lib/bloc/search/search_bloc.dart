import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gdgcordobaflutter/bloc/search/bloc.dart';
import 'package:gdgcordobaflutter/data/followers/github_repository.dart';
import 'package:gdgcordobaflutter/data/followers/search_result_error.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GithubRepository githubRepository;

  SearchBloc({@required this.githubRepository});

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
    Stream<SearchEvent> events,
    Stream<Transition<SearchEvent, SearchState>> Function(
      SearchEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  SearchState get initialState => SearchStateEmpty();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await githubRepository.search(searchTerm);
          yield SearchStateSuccess(results.users);
        } catch (error) {
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('Hubo un error, reintente nuevamente');
        }
      }
    }
  }
}
