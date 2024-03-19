import 'package:api/constants.dart';
import 'package:design_system/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../model/character/character_data_wrapper_response.dart';
import '../../model/comic/comic_data_wrapper_response.dart';
import '../character_service.dart';

class CharacterDio implements CharacterService {
  final Dio _dio;

  CharacterDio(this._dio);

  @override
  Future<Result<CharacterDataWrapperResponse, Exception>> getCharacters(String query, int offset) async {
    var queryParameters = <String, dynamic>{};
    if (query.isNotEmpty) {
      queryParameters["nameStartsWith"] = query;
    }
    queryParameters["offset"] = offset;
    queryParameters["orderBy"] = "modified";
    return runCatchingAsync(() async {
      final response = await _dio.get("$baseUrl/v1/public/characters", queryParameters: queryParameters);
      return CharacterDataWrapperResponse.fromMap(response.data);
    });
  }

  @override
  Future<Result<ComicDataWrapperResponse, Exception>> getCharactersByComicId(int id) async {
    var queryParameters = <String, dynamic>{};
    queryParameters["limit"] = 100;
    return runCatchingAsync(() async {
      final response = await _dio.get("$baseUrl/v1/public/characters/$id/comics", queryParameters: queryParameters);
      return ComicDataWrapperResponse.fromMap(response.data);
    });
  }
}
