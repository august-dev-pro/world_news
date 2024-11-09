import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Pour formater la date

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Formatage de la date actuelle
    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());

    return Container(
      margin: EdgeInsets.only(top: 60.0, bottom: 15.0), // Espacement en haut
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
              Container(
                padding: const EdgeInsets.all(4.0), // Padding autour de l'icône
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Forme circulaire
                  color: Colors.white, // Couleur de fond pour l'icône
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                    width: 1, // Bordure grise
                  ),
                ),
                child: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 90, 90, 90),
                  size: 22,
                ),
              ),
              const SizedBox(width: 8), // Espacement entre les deux icônes

              Container(
                padding: const EdgeInsets.all(4.0), // Padding autour de l'icône
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Forme circulaire
                  color: Colors.white, // Couleur de fond pour l'icône
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                    width: 1, // Bordure grise
                  ),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: const Color.fromARGB(255, 90, 90, 90),
                  size: 22,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
