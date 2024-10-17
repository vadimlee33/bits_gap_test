// ignore_for_file: library_private_types_in_public_api

import 'package:bitsgap_test_app/data/source/local/preferences_service.dart';
import 'package:mobx/mobx.dart';
import '../../../domain/entity/character.dart';
import '../../../domain/usecase/get_all_characters.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  final GetAllCharacters _getAllCharacters;
  final PreferencesService? _prefs;

  _CharacterStore({
    required GetAllCharacters getAllCharacters,
    PreferencesService? prefs,
  })  : _getAllCharacters = getAllCharacters,
        _prefs = prefs {
    fetchCharacters();
    loadFavorites();
  }

  @observable
  ObservableSet<int> favoritesList = ObservableSet<int>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  bool hasNextPage = true;

  @observable
  int currentPage = 1;

  @action
  void loadFavorites() {
    favoritesList = _prefs!.favorites;
  }

  @action
  void toggleFavorite(int id) {
    if (favoritesList.contains(id)) {
      favoritesList.remove(id);
    } else {
      favoritesList.add(id);
    }
    _prefs!.favorites = favoritesList;
  }

  @computed
  bool Function(int) get isFavorite => (int id) => favoritesList.contains(id);

  @action
  Future<void> fetchCharacters() async {
    isLoading = true;
    try {
      final fetchedCharacters = await _getAllCharacters.call(page: currentPage);
      hasNextPage = fetchedCharacters.hasNextPage;
      characters.addAll(fetchedCharacters.characters);
      currentPage++;
    } finally {
      isLoading = false;
    }
  }
}
