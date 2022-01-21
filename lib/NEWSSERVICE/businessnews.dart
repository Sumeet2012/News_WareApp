import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_ware/homepage/model.dart';
class News {
  List<NewsQueryModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=76b28ed8cb474162928aee24b560e1a7";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          NewsQueryModel newsModel = NewsQueryModel(
            newsHead: element["title"],
            newsDes: element["description"],
            newsUrl: element["url"],
            newsImg: element["urlToImage"],

          );
          news.add(newsModel);
        }
      });
    }
  }
}