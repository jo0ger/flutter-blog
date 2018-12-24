import 'package:redux/redux.dart' as redux;

import 'state.dart';
import 'reducer.dart';

class ThemeStore extends redux.Store<ThemeState> {
  ThemeStore({
    ThemeState initialState,
    redux.Reducer<ThemeState> reducer,
  }) : super(
    reducer ?? new ThemeReducer(),
    initialState: initialState ?? new ThemeState.initial()
  );
}

class Store extends redux.Store<AppState> {
  Store({
    AppState initialState,
    redux.Reducer<AppState> reducer,
  }) : super(
    reducer ?? new AppReducer(),
    initialState: initialState ?? new AppState.initial()
  );
}