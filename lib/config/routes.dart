import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';
import 'package:world_news/presentation/pages/Settings_Page.dart';
import 'package:world_news/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // Route pour la page d'accueil
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),

    // Route pour les paramètres
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsPage(),
    ),

    // Route pour le profil
    GoRoute(
      path: '/profile',
      builder: (context, state) => MyProfile(),
    ),

    // Route pour les détails d'une actualité
    GoRoute(
      path: '/newsDetail',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>? ?? {};
        return NewsDetailPage(
          title: args['title'] ?? 'Titre par défaut',
          details: args['details'] ?? 'Détails non disponibles',
        );
      },
    ),
  ],
);
