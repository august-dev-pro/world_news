import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
// Pour formater la date

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Formatage de la date actuelle
    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
    return Container(
      margin:
          const EdgeInsets.only(top: 60.0, bottom: 15.0), // Espacement en haut
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Colonne pour le titre et le sous-titre
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'World News',
                style: TextStyle(
                  color: Color(0xFF6E53F1),
                  fontFamily: "Quicksand-Bold",
                  fontSize: 20,
                  fontWeight:
                      FontWeight.w900, // Utilisation d'un poids plus fort
                ),
              ),
              const SizedBox(
                  height: 3), // Espacement entre le titre et le sous-titre
              Text(
                formattedDate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand-VariableFont_wght",
                  color: Color.fromARGB(179, 97, 97, 97),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          // Icônes de recherche et notification à droite

          Row(
            children: [
              SizedBox(
                width: 30, // Contrôle la largeur de l'icône circulaire
                height: 30, // Contrôle la hauteur de l'icône circulaire
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Forme circulaire
                    color: Colors.white, // Couleur de fond pour l'icône
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      width: 1, // Bordure grise
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero, // Supprime le padding par défaut
                    constraints:
                        const BoxConstraints(), // Enlève les contraintes par défaut
                    icon: const Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 90, 90, 90),
                      size: 22, // Taille de l'icône
                    ),
                    onPressed: () {
                      context.push("/settings");
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8), // Espacement entre les deux icônes

              SizedBox(
                width: 30, // Contrôle la largeur de l'icône circulaire
                height: 30, // Contrôle la hauteur de l'icône circulaire
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Forme circulaire
                    color: Colors.white, // Couleur de fond pour l'icône
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      width: 1, // Bordure grise
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero, // Supprime le padding par défaut
                    constraints:
                        const BoxConstraints(), // Enlève les contraintes par défaut
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 90, 90, 90),
                      size: 22, // Taille de l'icône
                    ),
                    onPressed: () {
                      context.push("/settings");
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
