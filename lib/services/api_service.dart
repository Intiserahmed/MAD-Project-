import 'dart:convert';

import 'package:http/http.dart';

import '../model/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=85f59a1795b74a29aeec44e1e0388db0";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    //first of all let's check that we got a 200 statu code: this mean that the request was a succes

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
