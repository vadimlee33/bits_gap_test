// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsStore on _CharacterDetailsStore, Store {
  late final _$characterAtom =
      Atom(name: '_CharacterDetailsStore.character', context: context);

  @override
  Character? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(Character? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterDetailsStore.isLoading', context: context);

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

  late final _$fetchCharacterDetailsAsyncAction = AsyncAction(
      '_CharacterDetailsStore.fetchCharacterDetails',
      context: context);

  @override
  Future<void> fetchCharacterDetails(int id) {
    return _$fetchCharacterDetailsAsyncAction
        .run(() => super.fetchCharacterDetails(id));
  }

  @override
  String toString() {
    return '''
character: ${character},
isLoading: ${isLoading}
    ''';
  }
}
