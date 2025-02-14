import 'package:flutter/material.dart';
import 'package:world_news/config/RoutesPath.dart';

class MyRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    // Ici, on analyse l'URL de la route
    // ignore: deprecated_member_use
    final uri = Uri.parse(routeInformation.location ?? '/');

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    } else if (uri.pathSegments.first == 'profile') {
      return RoutePath.profile();
    } else if (uri.pathSegments.first == 'newsDetails') {
      return RoutePath.newsDetails();
    } else if (uri.pathSegments.first == 'settings') {
      return RoutePath.settings();
    } else {
      return RoutePath.home(); // Si aucun match, aller à la page d'accueil
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    // Restaure l'URL pour chaque page
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    } else if (configuration.isProfilePage) {
      return const RouteInformation(location: '/profile');
    } else if (configuration.isNewsDetailsPage) {
      return const RouteInformation(location: '/newsDetails');
    } else if (configuration.isSettingsPage) {
      return const RouteInformation(location: '/settings');
    } else {
      return const RouteInformation(location: '/');
    }
  }
}
