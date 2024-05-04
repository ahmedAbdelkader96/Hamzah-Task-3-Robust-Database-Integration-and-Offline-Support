import 'package:flutter/cupertino.dart';
import 'package:task3/features/main_view/models/article.dart';
import 'package:task3/features/main_view/screens/article_detail.dart';

class Routes {
  static Future<dynamic> articleDetail(
      {required BuildContext context, required Article article}) async {
    return Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ArticleDetail(article: article)));
  }
}
