import 'package:home/domain/model/detail/detail_item.dart';
import 'package:home/domain/usecase/detai_usecase.dart';
import 'package:home/ui/home/component/model/item_image_name_model.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'model/detail_event.dart';
import 'model/detail_state.dart';

class DetailController {
  final DetailUseCase _useCase;

  DetailController(this._useCase);

  final _state = RxNotifier<DetailState>(DetailState());

  DetailState get state => _state.value;

  final event = RxNotifier<DetailEvent>(Idle());

  int pageCharacters = 0;
  int pageComics = 0;

  void init(DetailItem detailItem) {
    if (detailItem.isCharacter) {
      _state.value = state.copyWith(loading: true, titleBottomList: "Quadrinhos", detailItem: detailItem);
      _getCharactersByComicId(detailItem.id);
    } else {
      _getComicsByCharacterId(detailItem.id);
      _state.value = state.copyWith(loading: true, titleBottomList: "Personagens", detailItem: detailItem);
    }
  }

  void _getComicsByCharacterId(int id) async {
    await _useCase.getComicsByCharacterId(id).onSuccess((data) {
      var items = data.results
          .map((item) => ItemImageTitleModel(
                id: item.id,
                urlImage: item.urlImage,
                title: item.name,
                description: item.description,
                tag: item.getTag(),
              ))
          .toList(growable: true);
      var detailItem = state.detailItem?.copyWith(items: items);
      _state.value = state.copyWith(loading: false, detailItem: detailItem);
    }).onFailure((failure) {
      _state.value = state.copyWith(loading: false);
    });
  }

  void _getCharactersByComicId(int id) async {
    await _useCase.getCharactersByComicId(id).onSuccess((data) {
      var items = data.results
          .map((item) => ItemImageTitleModel(
                id: item.id,
                urlImage: item.urlImage,
                title: item.title,
                description: item.description,
                tag: item.getTag(),
              ))
          .toList(growable: true);
      var detailItem = state.detailItem?.copyWith(items: items);
      _state.value = state.copyWith(loading: false, detailItem: detailItem);
    }).onFailure((failure) {
      _state.value = state.copyWith(loading: false);
    });
  }
}
