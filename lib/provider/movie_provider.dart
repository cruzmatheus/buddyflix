import 'dart:convert';

import 'package:buddyflix/model/genre_response.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  final String _apiKey = "YOUR API KEY HERE";

  Future<List<GenreResponse>> retrieveGenresList() async {
    final http.Response response = await http.get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=" +
            _apiKey +
            "&language=en-US");

    if (response.statusCode == 200) {
      return (json.decode(response.body)['genres'] as List)
          .map((data) => new GenreResponse.fromJson(data))
          .toList();
    } else {
      throw Exception("Error retrieving genres");
    }
  }
}
