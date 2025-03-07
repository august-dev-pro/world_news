import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // Animation en boucle

    // Naviguer vers la page d'accueil après le chargement
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D26DF), // Couleur du fond
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),

          // Logo centré
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              'assets/imgs/logoWorldNews.jpg',
              width: 280,
            ),
          ),

          // Texte "World News"
          Text(
            'world news'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Quicksand-Bold",
              color: Colors.white,
              fontSize: 32,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // Animation de trois points
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedOpacity(
                    opacity: (_controller.value * 3).round() % 3 == index
                        ? 1.0
                        : 0.3,
                    duration: const Duration(milliseconds: 300),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 5,
                      ),
                    ),
                  );
                }),
              );
            },
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
