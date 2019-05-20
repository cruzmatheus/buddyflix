class Secret {
  final String movieApi;

  Secret({this.movieApi = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(movieApi: jsonMap['moviedb_api_key']);
  }
}
