import 'package:flutter/material.dart';
import 'package:world_news/data/models/news.dart';
import 'package:world_news/data/services/news_service.dart';
import 'package:world_news/domain/interfaces/news_repository.dart';
import 'package:world_news/domain/repositories/news_repository_impl.dart';

class NewsProvider with ChangeNotifier {
  final NewsRepository _newsRepository = NewsRepositoryImpl(NewsService());

  List<News> _newsList = [];
  bool _isLoading = false;

  List<News> get newsList => _newsList;
  bool get isLoading => _isLoading;

  List<String?> get categories =>
      _newsList.map((news) => news.category).toSet().toList();

  List<News> getNewsByCategory(String category) {
    return _newsList.where((news) => news.category == category).toList();
  }

  Future<void> loadNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _newsList = await _newsRepository.fetchNews();
    } catch (e) {
      print("Erreur lors du chargement des news: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
