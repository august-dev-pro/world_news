import 'package:flutter/material.dart';
import 'package:world_news/widgets/settings/SettingExploreWidget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paramètres',
          style: TextStyle(
            fontSize: 20, // Taille de la police
            fontWeight: FontWeight.w900, // Poids de la police
            fontFamily: "Quicksand-Bold", // Police personnalisée
            color: Colors.black, // Couleur du texte
          ),
        ),
        leading: SizedBox(
          width: 5,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Retour à la page précédente
            },
          ),
        ),
        backgroundColor:
            Colors.white, // Couleur de fond de la barre d'applications
        elevation: 0, // Enlève l'ombre de la barre d'applications
      ),
      body: Column(
        children: <Widget>[
          // Header avec l'icône de retour et le titre
          const Padding(
            padding: EdgeInsets.only(
                top: 0, // Réduit l'espace en haut
                left: 16.0,
                right: 16.0,
                bottom: 8),
          ),
          // Corps de la page
          Expanded(child: SettingExploreWidget()),
        ],
      ),
    );
  }
}
