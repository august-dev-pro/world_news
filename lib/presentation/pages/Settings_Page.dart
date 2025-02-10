import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final List<Map<String, String>> listElementsExplore = [
    {'icon': 'habit', 'titre': 'Thème', 'sousTitre': 'Changer de thème'},
    {'icon': 'user', 'titre': 'Compte', 'sousTitre': 'Gérer mon compte'},
    {
      'icon': 'settings',
      'titre': 'Paramètres',
      'sousTitre': 'Modifier les préférences'
    },
    {
      'icon': 'notifications',
      'titre': 'Notifications',
      'sousTitre': 'Configurer les alertes'
    }
  ];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Paramètres'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 12.0),
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Espacement avec les sections suivantes
                decoration: BoxDecoration(
                  color: const Color(0xFF6E53F1),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // décalage de l'ombre
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.diamond, // Icône de diamant
                      color: Colors.white, // Couleur de l'icône (modifiable)
                      size: 50, // Taille de l'icône
                    ),
                    const SizedBox(
                        width: 12), // Espacement entre l'icône et le texte
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Passer à Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand-Bold",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Supprimer toutes les annonces',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: "Quicksand-Regular",
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Bordures du bouton
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        backgroundColor:
                            Colors.white, // Couleur du bouton (modifiable)
                      ),
                      onPressed: () {
                        // Logique à définir ici si nécessaire
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Go',
                            style: TextStyle(
                              color: Color(0xFF6E53F1),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Color(0xFF6E53F1),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Section "Explorer"
              const Text(
                "Explorer",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  fontFamily: "Quicksand-Bold",
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: listElementsExplore.map((item) {
                  IconData iconData = Icons.settings; // Icône par défaut

                  // Définir l'icône en fonction de la valeur
                  switch (item['icon']) {
                    case 'habit':
                      iconData = Icons.palette_outlined;
                      break;
                    case 'user':
                      iconData = Icons.person;
                      break;
                    case 'notifications':
                      iconData = Icons.notifications;
                      break;
                  }

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              iconData,
                              color: Colors.blueGrey,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['titre'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: "Quicksand-Bold",
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['sousTitre'] ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontFamily: "Quicksand-Regular",
                                  ),
                                ),
                              ],
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
              const SizedBox(height: 16),
              // Section "À propos de nous"
              const Text(
                "À propos de nous",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  fontFamily: "Quicksand-Bold",
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: aboutElements.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
        ),
      ),
    );
  }
}
