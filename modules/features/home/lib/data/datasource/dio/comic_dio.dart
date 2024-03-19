import 'package:api/constants.dart';
import 'package:design_system/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../model/character/character_data_wrapper_response.dart';
import '../../model/comic/comic_data_wrapper_response.dart';
import '../comic_service.dart';

class ComicDio implements ComicService {
  final Dio _dio;

  ComicDio(this._dio);

  @override
  Future<Result<ComicDataWrapperResponse, Exception>> getComics(String query, int offset) async {
    var queryParameters = <String, dynamic>{};
    if (query.isNotEmpty) {
      queryParameters["titleStartsWith"] = query;
    }
    queryParameters["offset"] = offset;
    queryParameters["orderBy"] = "focDate";
    return runCatchingAsync(() async {
      final response = await _dio.get("$baseUrl/v1/public/comics", queryParameters: queryParameters);
      return ComicDataWrapperResponse.fromMap(response.data);
    });
  }

  @override
  Future<Result<CharacterDataWrapperResponse, Exception>> getComicsByCharacterId(int id) async {
    var queryParameters = <String, dynamic>{};
    queryParameters["limit"] = 100;
    return runCatchingAsync(() async {
      final response = await _dio.get("$baseUrl/v1/public/comics/$id/characters", queryParameters: queryParameters);
      return CharacterDataWrapperResponse.fromMap(response.data);
    });
  }
}
