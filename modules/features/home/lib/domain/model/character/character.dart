import '../item_list.dart';

class Character {
  int id;
  String name;
  String description;
  String resourceURI;
  String urlImage;
  ItemList comics;
  ItemList stories;
  ItemList events;
  ItemList series;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.resourceURI,
    required this.urlImage,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  String getTag() {
    return "comic$id";
  }
}
