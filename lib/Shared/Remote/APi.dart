import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Models/NewsModel/NewsModel.dart';
import 'package:news_app/Models/SourseModel/SourceResponse.dart';
import 'package:news_app/Shared/Styles/Constant.dart';

class ApiManager {
  static Future<SourceResponse> getsources(String Cate_id) async {
    Uri URL = Uri.https(baseURL, endPointSourses, {
      "apiKey": APIkey,
      "category":Cate_id,
    });
    Response response = await http.get(URL);
    var body = jsonDecode(response.body); // convert String into jason
    SourceResponse sourceResponse = SourceResponse.fromJson(body);
    return sourceResponse;
  }
//https://newsapi.org/v2/everything?q=Kevin Hurler&apiKey=c522079a708744aa8459b8f95bb34e9d
  static Future<NewsModel> getSearchNews(String Aut) async {
    Uri Url = Uri.https(
        baseURL, EndPonintNews, {"apiKey": APIkey, "q": Aut});
    Response response = await http.get(Url);
    var body = jsonDecode(response.body);
    NewsModel newsModel = NewsModel.fromJson(body);
    return newsModel;
  }

  static Future<NewsModel> getNews(String source_ID) async {
    Uri Url = Uri.https(
        baseURL, EndPonintNews, {"apiKey": APIkey, "sources": source_ID});
    Response response = await http.get(Url);
    var body = jsonDecode(response.body);
    NewsModel newsModel = NewsModel.fromJson(body);
    return newsModel;
  }
}
