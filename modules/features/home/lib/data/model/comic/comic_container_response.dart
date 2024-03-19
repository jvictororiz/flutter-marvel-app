
import 'comic_response.dart';

class ComicContainerResponse {
  int offset;
  int limit;
  int total;
  int count;
  List<ComicResponse> results;

  ComicContainerResponse({
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

  factory ComicContainerResponse.fromMap(Map<String, dynamic> map) {
    var results = map['results'] as List<dynamic>;
    return ComicContainerResponse(
      offset: map['offset'],
      limit: map['limit'],
      total: map['total'],
      count: map['count'],
      results: results.map((e) => ComicResponse.fromMap(e)).toList(growable: true),
    );
  }
}
