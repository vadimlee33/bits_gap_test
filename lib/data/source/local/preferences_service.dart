import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  set favorites(Set<int> favorites);
  ObservableSet<int> get favorites;
}

class PreferencesServiceImpl implements PreferencesService {
  static const String _favoritesKey = 'favorites';

  final SharedPreferences _sharedPreferences;

  const PreferencesServiceImpl(this._sharedPreferences);

  @override
  set favorites(Set<int> favorites) {
    List<String> stringList = favorites.map((int id) => id.toString()).toList();
    _sharedPreferences.setStringList(_favoritesKey, stringList);
  }

  @override
  ObservableSet<int> get favorites {
    List<String> stringList =
        _sharedPreferences.getStringList(_favoritesKey) ?? [];
    Set<int> intSet = stringList.map((String id) => int.parse(id)).toSet();
    return ObservableSet.of(intSet);
  }
}
