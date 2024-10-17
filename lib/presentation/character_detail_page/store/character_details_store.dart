// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import '../../../domain/entity/character.dart';
import '../../../domain/usecase/get_character_by_id.dart';

part 'character_details_store.g.dart';

class CharacterDetailsStore = _CharacterDetailsStore
    with _$CharacterDetailsStore;

abstract class _CharacterDetailsStore with Store {
  final GetCharacterById _getCharacterById;

  _CharacterDetailsStore({
    required GetCharacterById getCharacterById,
  }) : _getCharacterById = getCharacterById;

  @observable
  Character? character;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchCharacterDetails(int id) async {
    isLoading = true;
    try {
      character = await _getCharacterById.call(id: id);
    } finally {
      isLoading = false;
    }
  }
}
