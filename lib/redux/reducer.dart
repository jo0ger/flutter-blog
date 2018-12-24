import 'package:redux/redux.dart' as redux;
import 'state.dart';
import 'actions.dart';

class ThemeReducer extends redux.ReducerClass<ThemeState> {
  final _mapper = const <Type, Function>{
    ChangeThemeAction: _changeThemeAction
  };

  @override
  ThemeState call(ThemeState state, action) {
    Function reducer = _mapper[action.runtimeType];
    return reducer != null ? reducer(state, action) : state;
  }
}

ThemeState _changeThemeAction(ThemeState state, ChangeThemeAction action) {
  return state.apply(
    brightness: action.brightness,
    primaryColor: action.primaryColor,
    accentColor: action.accentColor
  );
}

class AppReducer extends redux.ReducerClass<AppState> {
  final _mapper = const <Type, Function>{
    FetchSettingAction: _fetchSetting,
    FetchCategoriesAction: _fetchCategories
  };

  @override
  AppState call(AppState state, action) {
    Function reducer = _mapper[action.runtimeType];
    return reducer != null ? reducer(state, action) : state;
  }
}

AppState _fetchSetting(AppState state, FetchSettingAction action) {
  return state.apply(setting: state.setting.apply(data: action.data, fetching: false));
}

AppState _fetchCategories(AppState state, FetchCategoriesAction action) {
  return state.apply(categories: state.categories.apply(data: action.data, fetching: false));
}
