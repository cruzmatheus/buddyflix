class MovieResponse {
  final int id;
  final String title;
  final String backdropPath;

  MovieResponse({this.id, this.title, this.backdropPath});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path']);
  }

  String getBackdropPath() {
    return "https://image.tmdb.org/t/p/w300/" + backdropPath;
  }
}
