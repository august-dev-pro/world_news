import 'package:flutter/material.dart';
import 'package:world_news/routes/app_routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Modifier la couleur de la barre de statut
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      /* statusBarColor: Colors
          .transparent, */ // Rendre la barre de statut transparente si nécessaire
      statusBarIconBrightness: Brightness.dark, // Texte et icônes en noir
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Cache le badge debug
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Fond blanc par défaut
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
