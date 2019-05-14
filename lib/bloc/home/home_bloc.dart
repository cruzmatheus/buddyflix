import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buddyflix/model/genre_response.dart';
import 'package:buddyflix/model/movie_response.dart';
import 'package:buddyflix/repository/genre_repository.dart';
import 'package:buddyflix/repository/movie_repository.dart';
import '../bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GenreRepository genreRepository = GenreRepository();
  final MovieRepository movieRepository = MovieRepository();
  final Map<String, List<MovieResponse>> moviesByGenre = {};
  List<GenreResponse> genres;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchGenres) {
      if (moviesByGenre.isEmpty || genres.isEmpty) {
        genres = (await genreRepository.retrieveGenresList()).sublist(0, 7);

        for (var genre in genres) {
          final List<MovieResponse> movies =
              await movieRepository.discoverMoviesByGenre(genre.id);
          moviesByGenre[genre.name] = movies;
        }
      }

      yield GenresFetchedState(genres: genres, moviesByGenre: moviesByGenre);
    }
  }
}
