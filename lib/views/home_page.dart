import 'package:flutter/material.dart';
import 'package:world_news/widgets/home/BannerWidget.dart';
import 'package:world_news/widgets/home/Header%20.dart';
import 'package:world_news/widgets/home/NewsTabsWidget.dart';
import 'package:world_news/widgets/bottom_nav_bar.dart'; // Importer le composant BottomNavBar
import 'package:world_news/routes/app_routes.dart'; // Importer les routes pour la navigation

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Indice de l'élément sélectionné dans la navbar

  // Fonction pour gérer la navigation lorsque l'utilisateur appuie sur un élément de la navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mettre à jour l'indice de l'élément sélectionné
    });

    // Navigation vers la page appropriée en fonction de l'index sélectionné
    if (index == 0) {
      Navigator.pushNamed(context, AppRoutes.home);
    } else if (index == 1) {
      Navigator.pushNamed(context, AppRoutes.newsDetail);
    } else if (index == 2) {
      Navigator.pushNamed(context, AppRoutes.home);
    } else if (index == 3) {
      Navigator.pushNamed(context, AppRoutes.newsDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Accueil'),
      ), */
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(), // Widget pour le header
            BannerSection(), // Widget pour la bannière
            NewsTabsWidget(), // Widget pour les tabs des actualités
            // Si tu souhaites ajouter d'autres widgets comme une liste d'articles :
            /*
            SizedBox(
              height: 500,
              child: ArticleList(), // Widget pour la liste d'articles
            ),
            */
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex, // L'indice sélectionné
        onItemTapped: _onItemTapped, // Fonction pour gérer la sélection
      ),
    );
  }
}
