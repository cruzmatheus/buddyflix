import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buddyflix/model/genre_response.dart';
import 'package:buddyflix/repository/genre_repository.dart';
import '../bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GenreRepository genreRepository = GenreRepository();

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchGenres) {
      final List<GenreResponse> response =
          await genreRepository.retrieveGenresList();
      yield GenresFetchedState(genres: response);
    }
  }
}
