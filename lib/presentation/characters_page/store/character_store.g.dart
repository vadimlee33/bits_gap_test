// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStore, Store {
  Computed<bool Function(int)>? _$isFavoriteComputed;

  @override
  bool Function(int) get isFavorite => (_$isFavoriteComputed ??=
          Computed<bool Function(int)>(() => super.isFavorite,
              name: '_CharacterStore.isFavorite'))
      .value;

  late final _$favoritesListAtom =
      Atom(name: '_CharacterStore.favoritesList', context: context);

  @override
  ObservableSet<int> get favoritesList {
    _$favoritesListAtom.reportRead();
    return super.favoritesList;
  }

  @override
  set favoritesList(ObservableSet<int> value) {
    _$favoritesListAtom.reportWrite(value, super.favoritesList, () {
      super.favoritesList = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: '_CharacterStore.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasNextPageAtom =
      Atom(name: '_CharacterStore.hasNextPage', context: context);

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportRead();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.reportWrite(value, super.hasNextPage, () {
      super.hasNextPage = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CharacterStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterStore.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  late final _$_CharacterStoreActionController =
      ActionController(name: '_CharacterStore', context: context);

  @override
  void loadFavorites() {
    final _$actionInfo = _$_CharacterStoreActionController.startAction(
        name: '_CharacterStore.loadFavorites');
    try {
      return super.loadFavorites();
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(int id) {
    final _$actionInfo = _$_CharacterStoreActionController.startAction(
        name: '_CharacterStore.toggleFavorite');
    try {
      return super.toggleFavorite(id);
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesList: ${favoritesList},
characters: ${characters},
isLoading: ${isLoading},
hasNextPage: ${hasNextPage},
currentPage: ${currentPage},
isFavorite: ${isFavorite}
    ''';
  }
}
