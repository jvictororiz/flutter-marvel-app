import 'package:home/data/mapper/comic_mapper.dart';
import 'package:home/domain/model/comic/comic_container.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/model/character/character_container.dart';
import '../datasource/character_service.dart';
import '../mapper/character_mapper.dart';

class CharacterRepository {
  final CharacterService _characterService;
  final CharacterMapper _characterMapper;
  final ComicMapper _comicMapper;

  CharacterRepository(this._characterService, this._characterMapper, this._comicMapper);

  Future<Result<CharacterContainer, Exception>> getCharacters(String query, int page) {
    return _characterService.getCharacters(query, page).map((response) {
      final result = _characterMapper.toCharacterModel(response);
      return result.data;
    });
  }

  Future<Result<ComicContainer, Exception>> getCharactersByComicId(int id) {
    return _characterService.getCharactersByComicId(id).map((response) {
      final result = _comicMapper.toComicModel(response);
      return result.data;
    });
  }
}
