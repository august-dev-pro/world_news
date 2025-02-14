import 'package:flutter/material.dart';
import 'package:world_news/config/RoutesPath.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';
import 'package:world_news/presentation/pages/Settings_Page.dart';
import 'package:world_news/presentation/pages/home_page.dart';

class MyRouterDelegate extends RouterDelegate<RoutePath> with ChangeNotifier {
  RoutePath _currentPath = RoutePath.home();
  RoutePath get currentPath => _currentPath;

  @override
  Widget build(BuildContext context) {
    // Naviguer vers la page en fonction de la route actuelle
    List<Page> pages = [];
    Widget page;

    if (_currentPath.isHomePage) {
      page = HomePage();
    } else if (_currentPath.isProfilePage) {
      page = MyProfile();
      /*    } else if (_currentPath.isNewsDetailsPage) {
      page = NewsDetailsPage(); */
    } else if (_currentPath.isSettingsPage) {
      page = SettingsPage();
    } else {
      page = HomePage(); // Page par défaut en cas de chemin non reconnu
    }

    pages.add(MaterialPage(child: page));

    return Navigator(
      pages: pages,
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    // Ici, tu peux gérer la logique de retour en arrière si nécessaire
    return false; // Retourne true si la pop a été réussie
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    // Modifier le chemin de la route et notifier la mise à jour
    _currentPath = configuration;
    notifyListeners();
  }

  void goToHome() {
    _currentPath = RoutePath.home();
    notifyListeners();
  }

  void goToProfile() {
    _currentPath = RoutePath.profile();
    notifyListeners();
  }

  void goToNewsDetails() {
    _currentPath = RoutePath.newsDetails();
    notifyListeners();
  }

  void goToSettings() {
    _currentPath = RoutePath.settings();
    notifyListeners();
  }
}
