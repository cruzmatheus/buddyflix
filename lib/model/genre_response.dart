class GenreResponse {
  final int id;
  final String name;

  GenreResponse({this.id, this.name});

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return GenreResponse(id: json['id'], name: json['name']);
  }
}
