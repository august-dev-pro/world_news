import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/presentation/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _updateSelectedIndex(String route) {
    setState(() {
      _selectedIndex = _getIndexFromRoute(route);
    });
  }

  int _getIndexFromRoute(String route) {
    switch (route) {
      case '/home':
        return 0;
      case '/search':
        return 1;
      case '/list':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/list');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      context.go('/home');
      return false;
    }
    return true; // Si on est déjà sur la Home, on peut revenir à l'application précédente
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
