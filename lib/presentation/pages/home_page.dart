import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/presentation/widgets/home/BannerWidget.dart';
import 'package:world_news/presentation/widgets/home/Header%20.dart';
import 'package:world_news/presentation/widgets/home/NewsTabsWidget.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar.dart'; // Importer le composant BottomNavBar
import 'package:world_news/config/routes.dart'; // Importer les routes pour la navigation

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
      context.go('/');
    } else if (index == 1) {
      context.go('/newsDetail');
    } else if (index == 2) {
      context.go('/');
    } else if (index == 3) {
      context.go('/profile');
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
            const Header(), // Widget pour le header
            BannerSection(), // Widget pour la bannière
            NewsTabsWidget(), // Widget pour les tabs des actualités
            // Si tu souhaites ajouter d'autres widgets comme une liste d'articles :
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
