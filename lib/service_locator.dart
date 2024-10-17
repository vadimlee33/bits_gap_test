import 'package:bitsgap_test_app/presentation/character_detail_page/store/character_details_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bitsgap_test_app/data/source/local/preferences_service.dart';
import 'package:bitsgap_test_app/presentation/characters_page/store/character_store.dart';
import 'package:bitsgap_test_app/data/source/network/api_service/api_service.dart';
import 'package:bitsgap_test_app/domain/repository/character_repository.dart';
import 'package:bitsgap_test_app/domain/usecase/get_all_characters.dart';
import 'package:bitsgap_test_app/domain/usecase/get_character_by_id.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerSingleton<PreferencesService>(
    PreferencesServiceImpl(prefs),
  );

  getIt.registerSingleton<ApiService>(
    ApiServiceImpl(),
  );

  getIt.registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(api: getIt<ApiService>()),
  );

  getIt.registerSingleton<GetAllCharacters>(
    GetAllCharacters(repository: getIt<CharacterRepository>()),
  );

  getIt.registerSingleton<GetCharacterById>(
    GetCharacterById(repository: getIt<CharacterRepository>()),
  );

  getIt.registerSingleton<CharacterStore>(
    CharacterStore(
      getAllCharacters: getIt<GetAllCharacters>(),
      prefs: getIt<PreferencesService>(),
    ),
  );

  getIt.registerSingleton<CharacterDetailsStore>(
    CharacterDetailsStore(
      getCharacterById: getIt<GetCharacterById>(),
    ),
  );
}
