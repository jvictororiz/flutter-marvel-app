import 'character_response_response.dart';

class CharacterContainerResponse {
  int offset;
  int limit;
  int total;
  int count;
  List<CharacterResponse> results;

  CharacterContainerResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results,
    };
  }

  factory CharacterContainerResponse.fromMap(Map<String, dynamic> map) {
    var results = map['results'] as List<dynamic>;
    return CharacterContainerResponse(
      offset: map['offset'] as int,
      limit: map['limit'] as int,
      total: map['total'] as int,
      count: map['count'] as int,
      results: results.map((e) => CharacterResponse.fromMap(e)).toList(growable: true),
    );
  }
}
