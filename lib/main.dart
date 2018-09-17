import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:dio/dio.dart';

import 'application.dart';
import './routes/routes.dart';
import 'api/api.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    this._initRouter();
    this._initSetting();
  }

  // 初始化并挂载router
  _initRouter() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  _initSetting() async {
    Response response = await Application.api.getSetting();
    Application.setting = response.data;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      onGenerateRoute: Application.router.generator
    );
    return app;
  }
}
