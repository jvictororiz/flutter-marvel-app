class Comic {
  int id;
  String title;
  String description;
  String urlImage;

  Comic({
    required this.id,
    required this.title,
    required this.description,
    required this.urlImage,
  });

  String getTag() {
    return "comic$id";
  }
}
