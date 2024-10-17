import 'package:bitsgap_test_app/data/source/network/api_service/api_service.dart';

import '../../data/models/character_model/character_model.dart';
import '../entity/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({int page = 0});
  Future<Character?> getCharacterById(int id);
  bool hasNextPage();
}

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService _api;

  CharacterRepositoryImpl({
    required ApiService api,
  }) : _api = api;

  @override
  bool hasNextPage() {
    return _api.hasNextPage();
  }

  @override
  Future<List<Character>> getCharacters({int page = 0}) async {
    final fetchedList = await _api.loadCharacters(page: page);
    return fetchedList
        .map((characterModel) => _mapModelToEntity(characterModel))
        .toList();
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    final characterModel = await _api.loadCharacterById(id);
    if (characterModel != null) {
      return _mapModelToEntity(characterModel);
    }
    return null;
  }

  Character _mapModelToEntity(CharacterModel model) {
    return Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      type: model.type,
      gender: model.gender,
      image: model.image,
      episode: model.episode,
      url: model.url,
      created: model.created,
    );
  }
}
