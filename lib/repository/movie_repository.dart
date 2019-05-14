import 'package:buddyflix/model/movie_response.dart';
import 'package:buddyflix/provider/movie_provider.dart';

class MovieRepository {
  MovieProvider _provider = MovieProvider();

  Future<List<MovieResponse>> discoverMoviesByGenre(int genre) async {
    return await _provider.discoverMoviesByGenre(genre);
  }

  Future<List<MovieResponse>> searchMoviesByTerm(String searchTerm) async {
    return await _provider.searchMoviesByTerm(searchTerm);
  }
}
