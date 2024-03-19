import 'package:result_dart/result_dart.dart';

import '../model/character/character_data_wrapper_response.dart';
import '../model/comic/comic_data_wrapper_response.dart';

abstract class ComicService {

  Future<Result<ComicDataWrapperResponse, Exception>> getComics(String query, int offset);

  Future<Result<CharacterDataWrapperResponse, Exception>> getComicsByCharacterId(int id);

}