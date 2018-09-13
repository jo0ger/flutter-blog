import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../../routes/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter_blog'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => Application.router.navigateTo(context, '/about', transition: TransitionType.inFromBottom)
          )
        ],
      ),
      body: new Center(
        child: new Text('data'),
      ),
    );
  }
}