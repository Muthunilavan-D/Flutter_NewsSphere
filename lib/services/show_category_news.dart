import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category_model.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async {
    String originalUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=c57cbf2faca64274aca8a6bd555156a9";
    
    String proxyUrl =
        'https://api.allorigins.win/get?url=${Uri.encodeComponent(originalUrl)}';

    var response = await http.get(Uri.parse(proxyUrl));

    if (response.statusCode == 200) {
      var proxyJson = jsonDecode(response.body);
      var jsonData = jsonDecode(proxyJson['contents']);

      if (jsonData['status'] == 'ok') {
        categories.clear(); // clear previous results
        jsonData["articles"].forEach((element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ShowCategoryModel showCategoryModel = ShowCategoryModel(
              urlToImage: element["urlToImage"],
              desc: element["description"],
              title: element["title"],
              url: element["url"],
            );
            categories.add(showCategoryModel);
          }
        });
      }
    } else {
      print("Failed to fetch news: ${response.statusCode}");
    }
  }
}
