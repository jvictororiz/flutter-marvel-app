import 'package:design_system/utils/list_ext.dart';
import 'package:home/data/repository/character_repository.dart';
import 'package:home/data/repository/comic_repository.dart';
import 'package:home/domain/model/comic/comic_container.dart';
import 'package:result_dart/result_dart.dart';

import '../model/character/character_container.dart';

class HomeUseCase {
  final CharacterRepository _characterRepository;
  final ComicRepository _comicRepository;

  final totalPageItemsCharacters = 30;
  final totalPageItemsComics = 12;

  HomeUseCase(this._characterRepository, this._comicRepository);

  Future<Result<CharacterContainer, Exception>> getCharacters(String query, int page) {
    return _characterRepository.getCharacters(query, page * totalPageItemsCharacters).map((success) {
      success.results = success.results.filter((item) => !item.urlImage.contains("image_not_available"));
      return success;
    });
  }

  Future<Result<ComicContainer, Exception>> getComics(String query, int page) {
    return _comicRepository.getComics(query, page * totalPageItemsComics).map((success) {
      success.results = success.results.filter((item) => !item.urlImage.contains("image_not_available"));
      return success;
    });
  }
}
