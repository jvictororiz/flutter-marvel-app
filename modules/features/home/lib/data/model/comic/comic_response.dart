import '../image_response.dart';

class ComicResponse {
  int id;
  String? title;
  String? description;
  ImageModelResponse thumbnail;

  ComicResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
    };
  }

  factory ComicResponse.fromMap(Map<String, dynamic> map) {
    return ComicResponse(
      id: map['id'] as int,
      title: map['title'],
      description: map['description'],
      thumbnail: ImageModelResponse.fromMap(map['thumbnail']),
    );
  }
}
