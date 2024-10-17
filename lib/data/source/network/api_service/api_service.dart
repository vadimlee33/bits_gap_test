import 'package:bitsgap_test_app/data/models/character_model/character_model.dart';
import 'package:dio/dio.dart';

// ignore_for_file: avoid_print

abstract class ApiService {
  Future<List<CharacterModel>> loadCharacters({int page = 0});
  Future<CharacterModel?> loadCharacterById(int id);
  bool hasNextPage();
}

class ApiServiceImpl implements ApiService {
  final dio = Dio();
  int _maxPages = 1;
  bool _hasNextPage = true;
  @override
  Future<List<CharacterModel>> loadCharacters({int page = 0}) async {
    try {
      final Response<Map<String, dynamic>> response = await dio
          .get('https://rickandmortyapi.com/api/character/?page=$page');
      _maxPages = response.data!['info']['pages'] as int;
      final charsList = (response.data!['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList();
      if (page == _maxPages) {
        _hasNextPage = false;
      }
      return charsList;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

  @override
  Future<CharacterModel?> loadCharacterById(int id) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get('https://rickandmortyapi.com/api/character/$id');
      return CharacterModel.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return null;
      } else {
        print(e);
      }
    }

    return null;
  }

  @override
  bool hasNextPage() => _hasNextPage;
}
