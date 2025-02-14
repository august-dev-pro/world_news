class RoutePath {
  final String? location;

  RoutePath.home() : location = '/';
  RoutePath.profile() : location = '/profile';
  RoutePath.newsDetails() : location = '/newsDetails';
  RoutePath.settings() : location = '/settings';

  bool get isHomePage => location == '/';
  bool get isProfilePage => location == '/profile';
  bool get isNewsDetailsPage => location == '/newsDetails';
  bool get isSettingsPage => location == '/settings';
}
