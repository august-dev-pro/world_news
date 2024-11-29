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

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Fond blanc pour la barre d'état
      statusBarIconBrightness: Brightness.dark, // Icônes noires
      systemNavigationBarColor:
          Colors.white, // Fond blanc pour la barre de navigation
      systemNavigationBarIconBrightness: Brightness.dark, // Icônes noires
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
