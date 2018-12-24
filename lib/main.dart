import 'dart:async';
import 'package:flutter/material.dart';

import 'config.dart';
import 'application.dart';

const AppName = 'Jooger.me';

void main() => init();

Future<Null> init() async {
  runApp(new Splash());
  await Application.init();
  runApp(new App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      theme: Config.themeData,
      onGenerateRoute: Application.router.generator
    );
    return app;
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Center(
              child: new Text(AppName, style: new TextStyle(fontSize: 32.0)),
            )
          ],
        ),
      ),
    );
  }
}
