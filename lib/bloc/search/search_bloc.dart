import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buddyflix/bloc/search/search_event.dart';
import 'package:buddyflix/bloc/search/search_state.dart';
import 'package:buddyflix/model/movie_response.dart';
import 'package:buddyflix/repository/movie_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MovieRepository _movieRepository = MovieRepository();
  FirebaseAnalytics analytics = FirebaseAnalytics();

  SearchState get initialState => new UnsearchedMoviesState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchMovies) {
      print(event.searchTerm);
      _sendAnalyticsEvent(event.searchTerm);
      final List<MovieResponse> movies =
          await _movieRepository.searchMoviesByTerm(event.searchTerm);
      yield SearchedMoviesState(movies);
    }
  }

  Future<void> _sendAnalyticsEvent(final String searchTerm) async {
    await analytics.logSearch(searchTerm: searchTerm);
  }
}
