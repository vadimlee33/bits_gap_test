import '../entity/character.dart';
import '../repository/character_repository.dart';

class GetCharacterById {
  GetCharacterById({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  Future<Character?> call({int id = 0}) async {
    final character = await _repository.getCharacterById(id);
    return character;
  }
}
