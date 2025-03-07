import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
/* import 'package:world_news/config/RouteInformationParser.dart';
import 'package:world_news/config/RouterDelegate.dart'; */
import 'package:world_news/config/router/app_router.dart';
import 'package:world_news/data/providers/news_provider.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Erreur lors du chargement du fichier .env : $e");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Modifier la couleur de la barre de statut
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.purple,
      // Fond blanc pour la barre d'état
      statusBarIconBrightness: Brightness.dark, // Icônes noires
      systemNavigationBarColor:
          Colors.white, // Fond blanc pour la barre de navigation
      systemNavigationBarIconBrightness: Brightness.dark, // Icônes noires
    ));

    /* String apiKey = dotenv.env['NEWS_API_KEY'] ?? 'default_value';
    print('API Key: $apiKey'); */

    return MaterialApp.router(
      title: 'World News',
      debugShowCheckedModeBanner: false, // Cache le badge debug
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Fond blanc par défaut
      ),
      routerConfig: appRouter,
    );
  }
}
