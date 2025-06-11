import 'dart:convert';
import 'package:news_app/models/show_category_model.dart';
import 'package:http/http.dart' as http;
class ShowCategoryNews {
List<ShowCategoryModel> categories = [];
Future<void> getCategoryNews (String category) async {
String url =
"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c57cbf2faca64274aca8a6bd555156a9";

var response= await http.get(Uri.parse(url));
var jsonData= jsonDecode(response.body);

if(jsonData['status'] == 'ok') {
jsonData["articles"].forEach((element) {
if (element ["urlToImage"]!= null && element ["description"]!=null) {
ShowCategoryModel showCategoryModel= ShowCategoryModel(
urlToImage: element ["urlToImage"],
desc: element ["description"],
title: element ["title"],
);
categories.add(showCategoryModel);
}});}}}