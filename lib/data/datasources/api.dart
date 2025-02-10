import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticles() async {
  final String apiKey = dotenv.env['NEWS_API_KEY']!;
  final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Article> articles = (data['articles'] as List)
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    return articles;
  } else {
    throw Exception('Failed to load news');
  }
}

class Article {
  final String title;
  final String description;
  final String urlToImage;

  Article(
      {required this.title,
      required this.description,
      required this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
    );
  }
}
