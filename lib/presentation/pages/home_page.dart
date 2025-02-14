/* import 'package:flutter/material.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/widgets/home/BannerWidget.dart';
import 'package:world_news/presentation/widgets/home/Header%20.dart';
import 'package:world_news/presentation/widgets/home/NewsTabsWidget.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar.dart'; // Importer le composant BottomNavBar

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

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Navigue vers la HomePage
      );
         } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NewsDetailPage()), // Navigue vers la page de détail des actualités
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ListPage()), // Navigue vers la page de la liste
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MyProfile()), // Navigue vers la page de profil
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
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
} */

/* import 'package:flutter/material.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/widgets/home/BannerWidget.dart';
import 'package:world_news/presentation/widgets/home/Header%20.dart';
import 'package:world_news/presentation/widgets/home/NewsTabsWidget.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      _pageController.jumpToPage(0);
      return false; // Empêche la fermeture
    }
    return true; // Ferme seulement si on est déjà sur l'accueil
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Désactiver le swipe
          children: [
            Column(
              children: [
                const Header(),
                BannerSection(),
                NewsTabsWidget(),
              ],
            ), // Accueil
            Center(
                child:
                    Text("Recherche")), // Remplace par ta vraie page Recherche
            Center(child: Text("Liste")), // Remplace par ta vraie page Liste
            MyProfile(), // Page Profil
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/presentation/widgets/home/BannerWidget.dart';
import 'package:world_news/presentation/widgets/home/Header.dart';
import 'package:world_news/presentation/widgets/home/NewsTabsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    if (GoRouterState.of(context).uri.toString() != '/home') {
      context.go('/home'); // Retourne à la home sans fermer l'app
      return false;
    }
    return true; // Permet la fermeture si on est déjà sur Home
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context), // Empêche la fermeture directe
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              BannerSection(),
              NewsTabsWidget(),
            ],
          ),
        ),
        /* bottomNavigationBar: BottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {
            if (index == 1) context.push('/search');
            if (index == 2) context.push('/list');
            if (index == 3) context.push('/profile');
          },
        ), */
      ),
    );
  }
}
