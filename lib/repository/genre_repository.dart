import 'package:buddyflix/model/genre_response.dart';
import 'package:buddyflix/provider/movie_provider.dart';

class GenreRepository {
  MovieProvider _provider = MovieProvider();

  Future<List<GenreResponse>> retrieveGenresList() async {
    return await _provider.retrieveGenresList();
  }
}
