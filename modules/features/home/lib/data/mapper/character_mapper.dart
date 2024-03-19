import 'package:home/data/model/character/character_container_response.dart';
import 'package:home/data/model/character/character_data_wrapper_response.dart';
import 'package:home/data/model/item_list_response.dart';
import 'package:home/data/model/item_summary_response.dart';
import 'package:home/domain/model/item_list.dart';

import '../../domain/model/character/character.dart';
import '../../domain/model/character/character_container.dart';
import '../../domain/model/character/character_data_wrapper.dart';
import '../../domain/model/item_summary.dart';
import '../model/character/character_response_response.dart';
import '../model/image_response.dart';

class CharacterMapper {
  CharacterDataWrapper toCharacterModel(CharacterDataWrapperResponse response) {
    return CharacterDataWrapper(code: response.code, status: response.status, copyright: response.copyright, attributionText: response.attributionText, attributionHTML: response.attributionHTML, etag: response.etag, data: _toCharacterContainerModel(response.data));
  }

  CharacterContainer _toCharacterContainerModel(CharacterContainerResponse response) {
    return CharacterContainer(offset: response.offset, limit: response.limit, total: response.total, count: response.count, results: response.results.map((item) => _toCharacter(item)).toList(growable: true));
  }

  Character _toCharacter(CharacterResponse response) {
    return Character(
      id: response.id,
      name: response.name,
      description: response.description??"",
      resourceURI: response.resourceURI??"",
      urlImage: toImageModel(response.thumbnail),
      comics: toItemListModel(response.comics),
      stories: toItemListModel(response.stories),
      events: toItemListModel(response.events),
      series: toItemListModel(response.series),
    );
  }

  String toImageModel(ImageModelResponse response) {
    return "${response.path??""}.${response.extension??""}";
  }

  ItemList toItemListModel(ItemListResponse response) {
    return ItemList(available: response.available, returned: response.returned, collectionURI: response.collectionURI, items: response.items.map((item) => toItemSummary(item)).toList(growable: true));
  }

  ItemSummary toItemSummary(ItemSummaryResponse response) {
    return ItemSummary(resourceURI: response.resourceURI, name: response.name);
  }
}
