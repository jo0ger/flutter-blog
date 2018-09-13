import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route-handlers.dart';

class Routes {
  static String home = "/";
  static String about = "/about";
  static String article = "/article/:id";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        }
    );
    router.define(home, handler: homePageHandler);
    router.define(about, handler: aboutPageHandler);
    router.define(article, handler: articlePageHandler);
  }
}