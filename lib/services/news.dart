import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String originalUrl =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=c57cbf2faca64274aca8a6bd555156a9";

    // Use AllOrigins CORS proxy
    String proxyUrl =
        "https://api.allorigins.win/get?url=${Uri.encodeComponent(originalUrl)}";

    var response = await http.get(Uri.parse(proxyUrl));

    if (response.statusCode == 200) {
      // Decode the CORS proxy wrapper
      var proxyJson = jsonDecode(response.body);

      // Decode the actual NewsAPI response
      var jsonData = jsonDecode(proxyJson["contents"]);

      if (jsonData["status"] == "ok") {
        news.clear(); // optional: clear old news if any
        jsonData["articles"].forEach((element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element["title"],
              desc: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
            );
            news.add(articleModel);
          }
        });
      }
    } else {
      print("Failed to fetch news from proxy: ${response.statusCode}");
    }
  }
}
