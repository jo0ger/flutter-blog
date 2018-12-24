import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api.dart';
import 'routes/routes.dart';

class Application {
  static String env = 'development';

  static var showToast = Fluttertoast.showToast;

  static Router router;

  static Api api = new Api();

  static SharedPreferences prefs;

  static var setting;

  static Future<Null> init() async {
    _seedRouter();
    await _seedSetting();
  }

  // 初始化并挂载router
  static _seedRouter() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  static Future<Null> _seedSetting() async {
    Response response = await api.getSetting();
    setting = response.data;
  }
}