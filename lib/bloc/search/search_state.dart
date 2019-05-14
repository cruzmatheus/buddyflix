import 'package:buddyflix/model/movie_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState extends Equatable {
  SearchState([Iterable props]) : super(props);
}

class UnsearchedMoviesState extends SearchState {}

class SearchedMoviesState extends SearchState {
  final List<MovieResponse> movies;

  SearchedMoviesState(this.movies) : super([movies]);
}
