/* import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/data/models/news.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';
import 'package:world_news/presentation/pages/Settings_Page.dart';
import 'package:world_news/presentation/pages/home_page.dart';
import 'package:world_news/presentation/pages/splash_screen.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar/MainScreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    StatefulShellRoute(
      builder: (context, state, navigationShell) {
        return MainScreen(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomePage();
              },
            ),
             GoRoute(
              path: '/search',
              builder: (context, state) {
                return SearchPage(); // Ajoute ta page de recherche
              },
            ),

            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return SettingsPage(); // Ajoute ta page de liste
              },
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return MyProfile();
              },
            ),
          ],
        ),
      ],
      // Correction du problème avec `navigationKey` et `pages`
      navigatorContainerBuilder: (context, shellState, pages) {
        return Navigator(
          key: shellState
              .key, // Utilisation de `shellState.key` pour la clé de navigation
          pages: [
            for (var page in pages)
              MaterialPage(
                  child: page), // Conversion des widgets en objets Page
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final news =
            state.extra as News; // Récupération de l'objet passé en extra
        return NewsDetailPage(news);
      },
    ),
  ],
);
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/data/models/news.dart';
import 'package:world_news/presentation/pages/My_Profile.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';
import 'package:world_news/presentation/pages/Settings_Page.dart';
import 'package:world_news/presentation/pages/home_page.dart';
import 'package:world_news/presentation/pages/splash_screen.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar/MainScreen.dart';

/* final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    StatefulShellRoute(
      builder: (context, state, navigationShell) {
        return MainScreen(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => MyProfile(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final news = state.extra as News;
        return NewsDetailPage(news);
      },
    ),
  ],
); */
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    StatefulShellRoute(
      builder: (context, state, navigationShell) {
        return MainScreen(child: navigationShell);
      },
      navigatorContainerBuilder: (context, navigationShell, children) {
        // This is the container for your navigation shells
        return Navigator(
          key: navigationShell.key,
          onPopPage: (route, result) {
            return route.didPop(result);
          },
          pages: [
            for (final child in children) MaterialPage(child: child),
          ],
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/',
              builder: (context, state) => HomePage(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => MyProfile(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final news = state.extra as News;
        return NewsDetailPage(news);
      },
    ),
  ],
);
