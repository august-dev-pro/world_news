import 'package:flutter/material.dart';

class MonWidgetStateless extends StatelessWidget {
  const MonWidgetStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      // Ajoutez vos widgets ici
      child: Text('Bonjour, ceci est un widget stateless!'),
    );
  }
}
