import 'package:equatable/equatable.dart';
import 'package:gdgcordobaflutter/data/followers/follower.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateSuccess extends SearchState {
  final List<Follower> items;

  const SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends SearchState {
  final String error;

  const SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
