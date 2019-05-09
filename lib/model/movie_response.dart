class MovieResponse {
  final int id;
  final String title;
  final String posterPath;

  MovieResponse({this.id, this.title, this.posterPath});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        id: json['id'], title: json['title'], posterPath: json['poster_path']);
  }

  String getPosterPath() {
    return "https://image.tmdb.org/t/p/w342/" + posterPath;
  }
}
