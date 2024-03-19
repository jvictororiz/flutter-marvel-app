import 'package:design_system/utils/list_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home/domain/model/character/character.dart';
import 'package:home/domain/model/comic/comic.dart';
import 'package:home/domain/model/detail/detail_item.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../domain/usecase/home_usecase.dart';
import 'model/home_event.dart';
import 'model/home_state.dart';

class HomeController {
  final HomeUseCase _homeUseCase;
  final FirebaseAuth _firebaseAuth;

  HomeController(this._homeUseCase, this._firebaseAuth);

  final _state = RxNotifier<HomeState>(HomeState());

  HomeState get state => _state.value;

  final event = RxNotifier<HomeEvent>(Idle());

  int pageCharacters = 0;
  int pageComics = 0;

  void init() {
    _state.value = state.copyWith(email: _firebaseAuth.currentUser?.email ?? "");
    getComics("", true);
    getCharacters("", true);
  }

  void getCharacters(String query, bool initialCall) async {
    if (initialCall) {
      _state.value = state.copyWith(loadingCharacters: true);
    } else {
      pageCharacters++;
    }
    await _homeUseCase.getCharacters(query, pageCharacters).onSuccess((data) {
      var characters = state.characters.toList(growable: true);
      characters.addAll(data.results);
      characters = characters.removeDuplicatesById((item) => item.id);
      _state.value = state.copyWith(characters: characters, loadingCharacters: false);
    }).onFailure((failure) {
      _state.value = state.copyWith(loadingCharacters: false);
    });
  }

  void getComics(String query, bool initialCall) async {
    if (initialCall) {
      _state.value = state.copyWith(loadingComics: true);
    } else {
      pageComics++;
    }
    await _homeUseCase.getComics(query, pageComics).onSuccess((data) {
      var comics = state.comics.toList(growable: true);
      comics.addAll(data.results);
      comics = comics.removeDuplicatesById((item) => item.id);
      _state.value = state.copyWith(comics: comics, loadingComics: false);
    }).onFailure((failure) {
      _state.value = state.copyWith(loadingComics: false);
    });
  }

  void logout() async {
    _state.value = state.copyWith(loadingLogout: true);
    await _firebaseAuth.signOut();
    _state.value = state.copyWith(loadingLogout: false);
    event.value = GoToLogin();
  }

  void submitQuery(String query) {
    pageCharacters = 0;
    pageComics = 0;
    _state.value.characters = [];
    _state.value.comics = [];
    getComics(query, true);
    getCharacters(query, true);
  }

  void tapOnCharacter(Character currentItem) {
    final detail = DetailItem(
      id: currentItem.id,
      name: currentItem.name,
      urlImage: currentItem.urlImage,
      description: currentItem.description,
      isCharacter: true,
      tagImage: currentItem.getTag(),
    );
    event.value = GoToDetail(detail);
  }

  void tapOnComic(Comic currentItem) {
    final detail = DetailItem(
      id: currentItem.id,
      name: currentItem.title,
      urlImage: currentItem.urlImage,
      description: currentItem.description,
      isCharacter: false,
      tagImage: currentItem.getTag(),
    );
    event.value = GoToDetail(detail);
  }
}
