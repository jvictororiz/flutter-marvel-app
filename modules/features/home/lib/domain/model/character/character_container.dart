import 'character.dart';

class CharacterContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  CharacterContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });
}
