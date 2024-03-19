import 'package:home/data/mapper/character_mapper.dart';
import 'package:home/domain/model/character/character_container.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/model/comic/comic_container.dart';
import '../datasource/comic_service.dart';
import '../mapper/comic_mapper.dart';

class ComicRepository {
  final ComicService _comicService;
  final ComicMapper _comicMapper;
  final CharacterMapper _characterMapper;

  ComicRepository(this._comicService, this._comicMapper, this._characterMapper);

  Future<Result<ComicContainer, Exception>> getComics(String query, int page){
    return _comicService.getComics(query, page).map((response) {
      final result = _comicMapper.toComicModel(response);
      return result.data;
    });
  }

  Future<Result<CharacterContainer, Exception>> getComicsByCharacterId(int id) {
    return _comicService.getComicsByCharacterId(id).map((response) {
      final result = _characterMapper.toCharacterModel(response);
      return result.data;
    });
  }
}
