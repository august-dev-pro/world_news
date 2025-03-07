import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsService {
  final String _baseUrl = "https://newsapi.org/v2/top-headlines";

  Future<List<Article>> fetchTopHeadlines({String country = "us"}) async {
    final apiKey = dotenv.env['NEWS_API_KEY']; // Fetch from .env file
    if (apiKey == null) {
      print('API Key is missing');
      return [];
    }

    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=5d2ce32ef5104caa80f58218ff948fe0');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['articles'];
        return data
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
      } else {
        throw Exception(
            'Failed to load news with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur de chargement des news: $e");
      return [];
    }
  }
}

class Article {
  final String id;
  final String title;
  final String description;
  final String content;
  final String urlToImage;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? 'undefined',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      content: json['content'] ?? 'No content',
      urlToImage: json['urlToImage'] ?? 'No image',
    );
  }
}
