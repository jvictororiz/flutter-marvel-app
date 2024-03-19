import 'package:result_dart/result_dart.dart';

import '../model/character/character_data_wrapper_response.dart';
import '../model/comic/comic_data_wrapper_response.dart';

abstract class CharacterService {
  Future<Result<CharacterDataWrapperResponse, Exception>> getCharacters(String query, int page);

  Future<Result<ComicDataWrapperResponse, Exception>> getCharactersByComicId(int id);
}
