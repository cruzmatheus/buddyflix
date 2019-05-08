import 'dart:convert';

import 'package:buddyflix/model/genre_response.dart';
import 'package:buddyflix/model/movie_response.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  final String _baseApiUri = "https://api.themoviedb.org/3";
  final String _apiKey = "YOUR API KEY HERE";
  final String _apiLanguage = "&language=en-US";

  Future<List<GenreResponse>> retrieveGenresList() async {
    final http.Response response = await http.get(
        _baseApiUri + "/genre/movie/list?api_key=" + _apiKey + _apiLanguage);

    if (response.statusCode == 200) {
      return (json.decode(response.body)['genres'] as List)
          .map((data) => new GenreResponse.fromJson(data))
          .toList();
    } else {
      throw Exception("Error retrieving genres");
    }
  }

  Future<List<MovieResponse>> discoverMoviesByGenre(int genre) async {
    final String sort = "&sort_by=popularity.desc";
    final String includeAdult = "&include_adult=false";
    final String includeVideo = "&include_video=false";
    final String page = "&page=1";
    final String withGenre = "&with_genres=" + genre.toString();

    final String requestUri = _baseApiUri +
        "/discover/movie?api_key=" +
        _apiKey +
        _apiLanguage +
        sort +
        includeAdult +
        includeVideo +
        page +
        withGenre;

    final http.Response response = await http.get(requestUri);

    if (response.statusCode == 200) {
      return (json.decode(response.body)['results'] as List)
          .map((data) => new MovieResponse.fromJson(data))
          .toList();
    } else {
      throw Exception("Error retrieving genres. Status code: " +
          response.statusCode.toString());
    }
  }
}
