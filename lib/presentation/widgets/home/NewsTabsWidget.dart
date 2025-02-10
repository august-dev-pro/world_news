import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/config/routes.dart';
import 'package:world_news/main.dart';

class NewsTabsWidget extends StatefulWidget {
  @override
  _NewsTabsWidgetState createState() => _NewsTabsWidgetState();
}

class _NewsTabsWidgetState extends State<NewsTabsWidget> {
  final Map<String, List<Map<String, String>>> fakeData = {
    'All': [
      {
        'about': "Guerre en Ukraine",
        'title':
            "le président s'est rendu à Kiev pour un tête-à-tête avec Poutine",
        'details':
            "Les tensions entre les deux pays atteignent un nouveau sommet.",
      },
      {
        'about': "Climat",
        'title': "les pays se réunissent pour trouver des solutions durables",
        'details':
            "Les pays membres de l'ONU discutent de nouvelles initiatives.",
      },
      {
        'about': "Économie",
        'title': "les marchés en hausse malgré les incertitudes",
        'details': "Les marchés financiers connaissent une reprise inattendue.",
      },
    ],
    'Business': [
      {
        'about': "Business",
        'title': "L'inflation impacte les marchés financiers",
        'details':
            "Les analystes prévoient une période de turbulences économiques.",
      },
      {
        'about': "Business",
        'title': "Investissements en économie verte",
        'details': "Les entreprises se tournent vers des solutions durables.",
      },
    ],
    'Gaming': [
      {
        'about': "Gaming",
        'title': "Les tendances pour 2024",
        'details': "Les jeux vidéo innovants de l'année à venir.",
      },
      {
        'about': "Gaming",
        'title': "Les jeux à surveiller cette année",
        'details': "Les titres les plus attendus et les plus prometteurs.",
      },
    ],
    'Technology': [
      {
        'about': "Technology",
        'title': "L'IA transforme le secteur",
        'details': "L'intelligence artificielle révolutionne la productivité.",
      },
      {
        'about': "Technology",
        'title': "La montée des smartphones pliables",
        'details': "Les nouveaux modèles deviennent des incontournables.",
      },
    ],
    'Football': [
      {
        'about': "Football",
        'title': "Le transfert de l'année",
        'details': "Les rumeurs autour du plus grand transfert du football.",
      },
      {
        'about': "Football",
        'title': "La coupe du monde arrive",
        'details': "Les équipes se préparent pour le tournoi international.",
      },
    ],
  };

  int _selectedTabIndex = 0;
  // Liste pour stocker l'état de couleur de fond de chaque article
  List<bool> _clickedItems = [];

  @override
  Widget build(BuildContext context) {
    List<String> categories = fakeData.keys.toList();

    return Column(
      children: [
        // Les onglets en haut
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 200), // Animation fluide
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: _selectedTabIndex == index
                          ? const Color.fromARGB(242, 0, 0, 0)
                          : const Color.fromARGB(24, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: _selectedTabIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

        // Liste des articles
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: fakeData[categories[_selectedTabIndex]]!.length,
            itemBuilder: (context, index) {
              var item = fakeData[categories[_selectedTabIndex]]![index];

              // Assure-toi que la liste _clickedItems est suffisamment longue pour éviter un débordement
              if (_clickedItems.length <= index) {
                _clickedItems
                    .add(false); // Ajouter un état de base pour l'élément
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Modifier l'état de couleur pour l'élément cliqué
                      _clickedItems[index] = !_clickedItems[index];
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      setState(() {
                        _clickedItems[index] = false;
                      });
                      context.go(
                        '/newsDetail',
                        extra: {
                          'about': item['about'],
                          'title': item['title'],
                          'details': item['details'],
                        },
                      );
                    });

                    // Après un court délai, revenir à la couleur transparente
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds: 200), // Animation de couleur au clic
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(78, 233, 233, 233),
                        width: 1, // Bordure grise
                      ),
                      color: _clickedItems[index]
                          ? const Color.fromARGB(110, 158, 158, 158)
                              .withOpacity(0.4)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['about']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  fontFamily: "Kanit-Thin",
                                  color: Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.2,
                                  fontFamily: "Kanit-Bold",
                                  color: Color(0xFF000000),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        size: 15,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "1h ago",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Quicksand-Thin",
                                          color:
                                              Color.fromARGB(179, 56, 56, 56),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.comment,
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        size: 12,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Quicksand-Bold",
                                          color:
                                              Color.fromARGB(179, 56, 56, 56),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image.asset(
                              "assets/imgs/buildding.jpg",
                              fit: BoxFit.cover,
                              height: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
