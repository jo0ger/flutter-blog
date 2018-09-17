import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../../config.dart';
import '../../application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 6,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Container(
            child: new TabBar(
              isScrollable: true,
              indicator: new UnderlineTabIndicator(),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                new Tab(text: '首页',),
                new Tab(text: '第二页',),
                new Tab(text: '第三页',),
                new Tab(text: '首页1',),
                new Tab(text: '第二页2',),
                new Tab(text: '第三页3',),
              ],
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => Application.router.navigateTo(context, '/about', transition: TransitionType.inFromBottom)
            )
          ],
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
            ),
            new Center(
              child: new Text('首页1'),
            ),
            new Center(
              child: new Text('第二页2'),
            ),
            new Center(
              child: new Text('第三页3'),
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