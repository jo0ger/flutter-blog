import 'package:flutter/material.dart';

abstract class IAction {
  IAction();
  String toString() => '$runtimeType';
}

class ChangeThemeAction extends IAction {
  final Brightness brightness;
  final MaterialColor primaryColor;
  final MaterialAccentColor accentColor;

  ChangeThemeAction({ this.brightness, this.primaryColor, this.accentColor });
}

class FetchSettingAction<T> extends IAction {
  final Iterable<T> data;

  FetchSettingAction(this.data);
}

class FetchCategoriesAction<T> extends IAction {
  final Iterable<T> data;

  FetchCategoriesAction(this.data);
}
