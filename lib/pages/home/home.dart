import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../../config.dart';
import '../../routes/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          title: new Container(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                hintText: '搜索...',
                hintStyle: new TextStyle(color: Colors.white),
              ),
              style: new TextStyle(
                color: const Color(0xffffffff),
                fontSize: 16.0
              ),
              controller: this._textController,
            ),
            color: Colors.brown,
            padding: new EdgeInsets.only(top:6.0, bottom: 6.0, left: 6.0, right: 6.0),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => Application.router.navigateTo(context, '/about', transition: TransitionType.inFromBottom)
            )
          ],
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.book), text: '首页',),
              new Tab(icon: new Icon(Icons.phone), text: '第二页',),
              new Tab(icon: new Icon(Icons.all_inclusive), text: '第三页',),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(
              child: new Text('首页'),
            ),
            new Center(
              child: new Text('第二页'),
            ),
            new Center(
              child: new Text('第三页'),
            )
          ],
        ),
      ),
    );
    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text('flutter-blog'),
    //     actions: <Widget>[
    //       new IconButton(
    //         icon: new Icon(Icons.add),
    //         onPressed: () => Application.router.navigateTo(context, '/about', transition: TransitionType.inFromBottom)
    //       )
    //     ],
    //   ),
    //   body: new Center(
    //     child: new Text('data'),
    //   ),
    // );
  }
}