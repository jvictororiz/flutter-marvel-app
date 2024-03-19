import 'comic.dart';

class ComicContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> results;

  ComicContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });
}
