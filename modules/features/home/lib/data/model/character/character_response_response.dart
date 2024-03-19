import '../image_response.dart';
import '../item_list_response.dart';

class CharacterResponse {
  int id;
  String name;
  String? description;
  String? resourceURI;
  ImageModelResponse thumbnail;
  ItemListResponse comics;
  ItemListResponse stories;
  ItemListResponse events;
  ItemListResponse series;

  CharacterResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.resourceURI,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'resourceURI': resourceURI,
      'thumbnail': thumbnail,
      'comics': comics,
      'stories': stories,
      'events': events,
      'series': series,
    };
  }

  factory CharacterResponse.fromMap(Map<String, dynamic> map) {
    return CharacterResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      resourceURI: map['resourceURI'] as String,
      thumbnail: ImageModelResponse.fromMap(map['thumbnail']),
      comics: ItemListResponse.fromMap(map['comics']),
      stories: ItemListResponse.fromMap(map['stories']),
      events: ItemListResponse.fromMap(map['events']),
      series: ItemListResponse.fromMap(map['series']),
    );
  }
}
