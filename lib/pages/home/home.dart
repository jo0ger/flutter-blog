import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config.dart';
import '../../application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  List _categoryList = <List>[];
  List<Tab> _tabs = [
    new Tab(text: '首页'),
    new Tab(text: '首页2'),
    new Tab(text: '首页3'),
    new Tab(text: '首页4'),
    new Tab(text: '首页5')
  ];
 
  @override
  void initState() {
    super.initState();
    // getCategoryList();
    _tabController = new TabController(
      vsync: this,
      length: _tabs.length,
    );
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    // _tabController.removeListener(tabListener);
    _tabController.dispose();
    super.dispose();
  }

  getCategoryList() async {
    Response response = await Application.api.getCategoryList();
    _categoryList = response.data;
    List<Tab> tabs = _categoryList.map((category) {
      return new Tab(text: category['name']);
    }).toList();
    print(tabs.length);
    _tabController = new TabController(
      vsync: this,
      length: tabs.length,
    );
    _tabs.addAll(new List.generate(tabs.length, (index) => tabs[index]));
  }

  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Config.themeData.primaryColor,
      textTheme: Config.themeData.textTheme,
      elevation: 0.0,
      title: new Container(
        child: new TabBar(
          isScrollable: true,
          indicator: new UnderlineTabIndicator(),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      actions: <Widget>[
        new Builder(builder: (BuildContext ctx) {
          return new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              Application.router.navigateTo(context, '/search', transition: TransitionType.inFromRight);
            }
          );
        })
      ],
    );
  }

  Widget _buildBody() {
    return new TabBarView(
      controller: _tabController,
      children: <Widget>[
        new Center(
          child: new Text(Application.setting.toString()),
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
          child: new Text('首页2'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _categoryList.length,
      child: new Scaffold(
        appBar: _buildAppBar(),
        drawer: new Drawer(     //侧边栏按钮Drawer
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(   //Material内置控件
                accountName: new Text('CYC'), //用户名
                accountEmail: new Text('example@126.com'),  //用户邮箱
                currentAccountPicture: new GestureDetector( //用户头像
                  onTap: () => print('current user'),
                  child: new CircleAvatar(    //圆形图标控件
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),//图片调取自网络
                  ),
                ),
                // decoration: new BoxDecoration(    //用一个BoxDecoration装饰器提供背景图片
                //   image: new DecorationImage(
                //     fit: BoxFit.fill,
                //     // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                //     //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                //     image: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/8346438/e3e45f12-b3c2-45a1-95ac-a608fa3b8960?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                //   ),
                // ),
              ),
              new ListTile(   //第一个功能项
                title: new Text('First Page'),
                trailing: new Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.of(context).pop();
                }
              ),
              new ListTile(   //第二个功能项
                title: new Text('Second Page'),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                } 
              ),
              new ListTile(   //第二个功能项
                title: new Text('Second Page'),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                } 
              ),
              new Divider(),    //分割线控件
              new ListTile(   //退出按钮
                title: new Text('Close'),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
              ),
            ],
          ),
        ),
        body: _buildBody(),
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