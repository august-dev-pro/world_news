import 'package:world_news/data/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> fetchNews();
}
