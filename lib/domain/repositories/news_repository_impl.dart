import 'package:world_news/data/models/news.dart';
import 'package:world_news/data/services/news_service.dart';
import 'package:world_news/domain/interfaces/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsService _newsService;

  NewsRepositoryImpl(this._newsService);

  @override
  Future<List<News>> fetchNews() async {
    try {
      List<dynamic> articles =
          await _newsService.fetchTopHeadlines(country: "fr");
      print("Articles reçus: $articles");

      return articles.map((article) {
        String title = article.title ?? "Titre inconnu";
        String description = article.content ?? "Pas de description";
        String conten = article.content ?? "Pas de content";

        // Déterminer la catégorie
        String category = determineCategory(title, description);

        return News(
          id: article.id ?? "undefined",
          title: title,
          details: description,
          content: conten,
          category: category,
          imageUrl: article.urlToImage ?? "https://via.placeholder.com/150",
        );
      }).toList();
    } catch (e) {
      print("Erreur dans NewsRepositoryImpl: $e");
      return [];
    }
  }

  String determineCategory(String title, String description) {
    String content = "$title $description".toLowerCase();

    if (content.contains("politique") ||
        content.contains("élection") ||
        content.contains("gouvernement")) {
      return "Politique";
    } else if (content.contains("sport") ||
        content.contains("football") ||
        content.contains("basket") ||
        content.contains("tennis")) {
      return "Sport";
    } else if (content.contains("économie") ||
        content.contains("bourse") ||
        content.contains("finance") ||
        content.contains("bitcoin")) {
      return "Économie";
    } else if (content.contains("technologie") ||
        content.contains("startup") ||
        content.contains("ia") ||
        content.contains("robot")) {
      return "Technologie";
    } else if (content.contains("santé") ||
        content.contains("covid") ||
        content.contains("médicament") ||
        content.contains("hôpital")) {
      return "Santé";
    } else if (content.contains("culture") ||
        content.contains("cinéma") ||
        content.contains("musique") ||
        content.contains("livre")) {
      return "Culture";
    } else {
      return "Divers";
    }
  }
}
