// routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:world_news/views/NewsDetailPage.dart';
import 'package:world_news/views/Settings_Page.dart';
import 'package:world_news/views/home_page.dart';

class News {
  final String title;
  final String about;
  final String details;

  News({required this.title, required this.about, required this.details});
}

class AppRoutes {
  static const String home = '/';
  static const String newsDetail = '/newsDetail';
  static const String setting = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case setting:
        return MaterialPageRoute(builder: (_) => const SettingsPage());

      /* case newsDetail:
        return MaterialPageRoute(
          builder: (_) => NewsDetailView(article: settings.arguments),
        ); */
      case newsDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => NewsDetailPage(
              about:
                  args['about'] ?? '', // Assurez-vous que vous passez 'about'
              title:
                  args['title'] ?? '', // Assurez-vous que vous passez 'title'
              details: args['details'] ??
                  '', // Assurez-vous que vous passez 'details'
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
                child: Text('Données manquantes pour la route $newsDetail')),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('Aucune route trouvée pour ${settings.name}')),
          ),
        );
    }
  }
}
