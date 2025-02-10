import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_news/config/routes.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Erreur lors du chargement du fichier .env : $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Modifier la couleur de la barre de statut
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Fond blanc pour la barre d'état
      statusBarIconBrightness: Brightness.dark, // Icônes noires
      systemNavigationBarColor:
          Colors.white, // Fond blanc pour la barre de navigation
      systemNavigationBarIconBrightness: Brightness.dark, // Icônes noires
    ));

    String apiKey = dotenv.env['NEWS_API_KEY'] ?? 'default_value';
    print('API Key: $apiKey');

    return MaterialApp.router(
      title: 'World News',
      debugShowCheckedModeBanner: false, // Cache le badge debug
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Fond blanc par défaut
      ),
      routerConfig: router, // Utilisation de GoRouter pour la navigation
    );
  }
}
