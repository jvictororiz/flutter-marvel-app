import 'package:home/data/repository/character_repository.dart';
import 'package:home/data/repository/comic_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../model/character/character_container.dart';
import '../model/comic/comic_container.dart';

class DetailUseCase {
  final ComicRepository _comicRepository;
  final CharacterRepository _characterRepository;

  DetailUseCase(this._comicRepository, this._characterRepository);

  Future<Result<ComicContainer, Exception>> getCharactersByComicId(int id) {
    return _characterRepository.getCharactersByComicId(id);
  }

  Future<Result<CharacterContainer, Exception>> getComicsByCharacterId(int id) {
    return _comicRepository.getComicsByCharacterId(id);
  }
}
