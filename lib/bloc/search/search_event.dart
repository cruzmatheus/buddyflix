import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super(props);
}

class FetchMovies extends SearchEvent {
  final String searchTerm;

  FetchMovies(this.searchTerm) : super([searchTerm]);
}
