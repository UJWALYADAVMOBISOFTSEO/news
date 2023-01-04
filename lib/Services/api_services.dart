import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/Model/ArticleModel.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f62a353d60ac4fd09618b7f75dba858e";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw "Something Went Wrong";
    }
  }
}

class ApiServiceSports{
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f62a353d60ac4fd09618b7f75dba858e";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw "Something Went Wrong";
    }
  }
}

class ApiServiceMovies{
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f62a353d60ac4fd09618b7f75dba858e";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw "Something Went Wrong";
    }
  }
}

class ApiServiceCrime{
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f62a353d60ac4fd09618b7f75dba858e";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw "Something Went Wrong";
    }
  }
}
