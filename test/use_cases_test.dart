import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bitsgap_test_app/domain/entity/character.dart';
import 'package:bitsgap_test_app/domain/repository/character_repository.dart';
import 'package:bitsgap_test_app/domain/usecase/get_character_by_id.dart';
import 'package:bitsgap_test_app/domain/usecase/get_all_characters.dart';

// Тестирование Use Case
// В данном случае тестируются два Use Case: GetCharacterById и GetAllCharacters.

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(Character());
  });

  group('GetCharacterById', () {
    late MockCharacterRepository mockRepository;
    late GetCharacterById useCase;

    setUp(() {
      mockRepository = MockCharacterRepository();
      useCase = GetCharacterById(repository: mockRepository);
    });

    test('should return character when character is found', () async {
      final character = Character();

      when(() => mockRepository.getCharacterById(1))
          .thenAnswer((_) async => character);

      final result = await useCase.call(id: 1);

      expect(result!.id, character.id);
      verify(() => mockRepository.getCharacterById(1)).called(1);
    });

    test('should return null when character is not found', () async {
      when(() => mockRepository.getCharacterById(1))
          .thenAnswer((_) async => null);

      final result = await useCase.call(id: 1);

      expect(result, null);
      verify(() => mockRepository.getCharacterById(1)).called(1);
    });
  });

  group('GetAllCharacters', () {
    late MockCharacterRepository mockRepository;
    late GetAllCharacters useCase;

    setUp(() {
      mockRepository = MockCharacterRepository();
      useCase = GetAllCharacters(repository: mockRepository);
    });

    test('should return characters when characters are found', () async {
      final characters = [Character(), Character()];

      when(() => mockRepository.hasNextPage()).thenReturn(true);
      when(() => mockRepository.getCharacters(page: 0))
          .thenAnswer((_) async => characters);

      final result = await useCase.call(page: 0);

      expect(result.characters, characters);
      expect(result.hasNextPage, true);
      verify(() => mockRepository.hasNextPage()).called(1);
      verify(() => mockRepository.getCharacters(page: 0)).called(1);
    });

    test('should return empty list when no characters are found', () async {
      when(() => mockRepository.hasNextPage()).thenReturn(false);
      when(() => mockRepository.getCharacters(page: 0))
          .thenAnswer((_) async => []);

      final result = await useCase.call(page: 0);

      expect(result.characters, []);
      expect(result.hasNextPage, false);
      verify(() => mockRepository.hasNextPage()).called(1);
      verifyNever(() => mockRepository.getCharacters(page: 0));
    });
  });
}
