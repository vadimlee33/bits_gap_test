import '../entity/character.dart';
import '../repository/character_repository.dart';

class GetAllCharactersResult {
  final List<Character> characters;
  final bool hasNextPage;

  GetAllCharactersResult({
    required this.characters,
    required this.hasNextPage,
  });
}

class GetAllCharacters {
  GetAllCharacters({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  Future<GetAllCharactersResult> call({int page = 0}) async {
    final hasNextPage = _repository.hasNextPage();
    if (hasNextPage) {
      final list = await _repository.getCharacters(page: page);
      return GetAllCharactersResult(characters: list, hasNextPage: true);
    }
    return GetAllCharactersResult(characters: [], hasNextPage: false);
  }
}
