import 'package:flutter/material.dart';

class SettingsAboutUs extends StatelessWidget {
  SettingsAboutUs({super.key});

  final List<Map<String, dynamic>> aboutElements = [
    {'icon': Icons.feedback, 'titre': 'Feedback'},
    {'icon': Icons.star_rate, 'titre': 'Nous évaluer'},
    {'icon': Icons.share, 'titre': 'Partager l\'app'},
    {'icon': Icons.apps, 'titre': 'Plus d\'applications'},
    {'icon': Icons.translate, 'titre': 'Aidez-nous à traduire'},
    {'icon': Icons.privacy_tip, 'titre': 'Politique de confidentialité'},
    {'icon': Icons.gavel, 'titre': 'Conditions d\'utilisation'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          const Text(
            "À propos de nous",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17,
              fontFamily: "Quicksand-Bold",
            ),
          ),
          const SizedBox(height: 8),
          // Liste des éléments de réglage
          Column(
            children: aboutElements.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          item['icon'],
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item['titre'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: "Quicksand-Bold",
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
