import 'package:home/domain/model/character/character.dart';

import '../../../../domain/model/comic/comic.dart';

class HomeState {
  String email;
  bool loadingLogout;
  bool loadingCharacters;
  bool loadingComics;
  bool errorLoadComics;
  bool errorLoadCharacters;
  bool hasNextPageCharacters;
  bool hasNextPageComics;
  List<Character> characters;
  List<Comic> comics;

  HomeState({
    this.email = "",
    this.loadingLogout = false,
    this.errorLoadCharacters = false,
    this.loadingCharacters = false,
    this.loadingComics = false,
    this.errorLoadComics = false,
    this.hasNextPageCharacters = true,
    this.hasNextPageComics = true,
    this.characters = const [],
    this.comics = const [],
  });

  HomeState copyWith({
    String? email,
    bool? loadingLogout,
    bool? loadingCharacters,
    bool? loadingComics,
    bool? errorLoadComics,
    bool? errorLoadCharacters,
    bool? hasNextPageCharacters,
    bool? hasNextPageComics,
    List<Character>? characters,
    List<Comic>? comics,
  }) {
    return HomeState(
      email: email ?? this.email,
      loadingComics: loadingComics ?? this.loadingComics,
      hasNextPageCharacters: hasNextPageCharacters ?? this.hasNextPageCharacters,
      hasNextPageComics: hasNextPageComics ?? this.hasNextPageComics,
      errorLoadComics: errorLoadComics ?? this.errorLoadComics,
      errorLoadCharacters: errorLoadCharacters ?? this.errorLoadCharacters,
      loadingLogout: loadingLogout ?? this.loadingLogout,
      loadingCharacters: loadingCharacters ?? this.loadingCharacters,
      characters: characters ?? this.characters,
      comics: comics ?? this.comics,
    );
  }
}
