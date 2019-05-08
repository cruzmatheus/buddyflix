import 'package:buddyflix/model/genre_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class InitialHomeState extends HomeState {}

class GenresFetchedState extends HomeState {
  final List<GenreResponse> genres;

  GenresFetchedState({this.genres}) : super([genres]);

  String toString() => "GenresFetchedState { genres sizer: ${genres.length}";
}
