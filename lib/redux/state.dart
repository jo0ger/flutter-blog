import 'package:flutter/material.dart';

abstract class IRequestState {
  IRequestState();

  IRequestState apply({ Iterable data, bool fetching });
}

class ThemeState {
  static final kBrightnessKey = "BrightnessKey";
  static final kPrimaryColorKey = "PrimaryColorKey";
  static final kAccentColorKey = "kAccentColorKey";

  final ThemeData _theme;
  final Brightness brightness;
  final MaterialColor primaryColor;
  final MaterialAccentColor accentColor;

  ThemeData get theme => this._theme;

  ThemeState({ this.brightness, this.primaryColor, this.accentColor })
    : _theme = new ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      accentColor: accentColor
    );
  
  factory ThemeState.initial() => new ThemeState(
    brightness: Brightness.light,
    primaryColor: Colors.indigo,
    accentColor: Colors.pinkAccent
  );

  ThemeState apply({
    Brightness brightness,
    MaterialColor primaryColor,
    MaterialAccentColor accentColor
  }) => new ThemeState(
    brightness: brightness ?? this.brightness,
    primaryColor: primaryColor ?? this.primaryColor,
    accentColor: accentColor ?? this.accentColor
  );
}

class SettingState extends IRequestState {
  final Iterable data;
  final bool fetching;

  SettingState({ this.data, this.fetching }): super();

  SettingState.initial()
    : data = null,
      fetching = false;

  @override
  SettingState apply({ Iterable data, bool fetching }) => new SettingState(
    data: data ?? this.data,
    fetching: fetching ?? this.fetching
  );
}

class CategoryState extends IRequestState {
  final Iterable data;
  final bool fetching;

  CategoryState({ this.data, this.fetching }): super();

  CategoryState.initial()
    : data = null,
      fetching = false;

  @override
  CategoryState apply({ Iterable data, bool fetching }) => new CategoryState(
    data: data ?? this.data,
    fetching: fetching ?? this.fetching
  );
}
class AppState {
  final SettingState setting;
  final CategoryState categories;

  AppState({
    this.setting,
    this.categories
  });

  AppState.initial()
    : setting = new SettingState.initial(),
      categories = new CategoryState.initial();

  AppState apply({
    SettingState setting,
    CategoryState categories
  }) => new AppState(
    setting: setting ?? this.setting,
    categories: categories ?? this.categories
  );
}
