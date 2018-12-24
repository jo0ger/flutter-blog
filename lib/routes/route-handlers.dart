import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/home/home.dart';
import '../pages/article/article.dart';
import '../pages/about/about.dart';
import '../pages/search/search.dart';

final homePageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  }
);

final articlePageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String articleId = params['id'][0];
    return new ArticlePage(articleId);
  }
);

final aboutPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AboutPage();
  }
);

final searchPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SearchPage();
  }
);
