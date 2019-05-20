import 'dart:convert';

import 'package:buddyflix/model/genre_response.dart';
import 'package:buddyflix/model/movie_response.dart';
import 'package:buddyflix/secret_loader.dart';
import 'package:http/http.dart' as http;

import '../secrets.dart';

class MovieProvider {
  final String _baseApiUri = "https://api.themoviedb.org/3";
  final String _apiLanguage = "&language=en-US";

  Future<List<GenreResponse>> retrieveGenresList() async {
    String _apiKey = await _getApiKey();
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
    String _apiKey = await _getApiKey();
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
      throw Exception("Error retrieving movies by genres. Status code: " +
          response.statusCode.toString());
    }
  }

  Future<List<MovieResponse>> searchMoviesByTerm(String searchTerm) async {
    String _apiKey = await _getApiKey();
    final String query = "&query=" + searchTerm;
    final String page = "&page=1";
    final String includeAdult = "&include_adult=false";

    final String requestUri = _baseApiUri +
        "/search/movie?api_key=" +
        _apiKey +
        _apiLanguage +
        query +
        page +
        includeAdult;

    final http.Response response = await http.get(requestUri);

    if (response.statusCode == 200) {
      return (json.decode(response.body)['results'] as List)
          .map((data) => new MovieResponse.fromJson(data))
          .toList();
    } else {
      throw Exception("Error retrieving movies by term. Status code: " +
          response.statusCode.toString());
    }
  }

  Future<String> _getApiKey() async {
    Secret apiKey = await SecretLoader(secretPath: "secrets.json").load();
    return apiKey.movieApi;
  }
}
