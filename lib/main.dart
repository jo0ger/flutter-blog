import 'package:flutter/material.dart';
import './pages/home/home.dart';
import 'package:fluro/fluro.dart';
import './routes/application.dart';
import './routes/routes.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    this._initRouter();
  }

  // 初始化并挂载router
  _initRouter() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'flutter_blog',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
      // home: new HomePage(),
    );
    print("route===========${Application.router.generator}");
    print("初始路由：${app.initialRoute}");
    return app;
  }
}
