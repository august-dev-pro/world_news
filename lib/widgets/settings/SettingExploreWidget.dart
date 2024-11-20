/* import 'package:flutter/material.dart';

class SettingExploreWidget extends StatelessWidget {
  SettingExploreWidget({
    super.key,
  });

  final List<Map<String, String>> listElements = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Title for the section
            const Align(
              alignment: Alignment.centerLeft, // Aligne le texte à gauche
              child: Text(
                "Explorer",
                style: TextStyle(
                  fontWeight: FontWeight.w900, // Poids en gras
                  fontSize: 17,
                  fontFamily:
                      "Quicksand-Bold", // Spécifie la police personnalisée
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // List of settings items
            Expanded(
              child: ListView.builder(
                itemCount: listElements.length,
                itemBuilder: (context, index) {
                  final item = listElements[index];
                  IconData iconData = Icons.settings; // Default icon

                  // Set icon based on value
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                iconData,
                                color: Colors.blueGrey,
                                size: 20, // Icon size
                              ),
                              const SizedBox(
                                  width: 8), // Spacing between icon and text
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
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
 */
import 'package:flutter/material.dart';

class SettingExploreWidget extends StatelessWidget {
  SettingExploreWidget({super.key});

  final List<Map<String, String>> listElements = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          const Text(
            "Explorer",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17,
              fontFamily: "Quicksand-Bold",
            ),
          ),
          const SizedBox(height: 8),
          // Liste des éléments de réglage
          Column(
            children: listElements.map((item) {
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        ],
      ),
    );
  }
}
