import 'package:flutter/material.dart';

// 全局配置
class Config {
  // 主题配置
  static Map<String, dynamic> themeConfig = {
    // 默认主题
    'default': new ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue
    )
  };

  // 当前主题类型
  static String theme = 'default';

  // 当前主题
  static get themeData {
    return themeConfig[theme];
  }
}
