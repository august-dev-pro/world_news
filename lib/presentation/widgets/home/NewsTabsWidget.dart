/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';

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

                      Future.delayed(const Duration(milliseconds: 300), () {
                        setState(() {
                          _clickedItems[index] = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(
                              title: item[
                                  'title']!, // Passer le titre de l'élément
                              details: item[
                                  'details']!, // Passer les détails de l'élément
                            ),
                          ),
                        );
                      });
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
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:world_news/data/providers/news_provider.dart';
import 'package:world_news/presentation/pages/NewsDetailPage.dart';

class NewsTabsWidget extends StatefulWidget {
  @override
  _NewsTabsWidgetState createState() => _NewsTabsWidgetState();
}

class _NewsTabsWidgetState extends State<NewsTabsWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<NewsProvider>(context, listen: false).loadNews());
  }

  int _selectedTabIndex = 0;
  List<bool> _clickedItems = [];

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final categories = newsProvider.categories;

// Vérifie si la liste des catégories est vide
    if (categories.isEmpty) {
      print("⚠️ Aucune catégorie disponible !");
      return Center(child: Text("Aucune catégorie disponible"));
    }

// Vérifie si l'index sélectionné est valide
    if (_selectedTabIndex < 0 || _selectedTabIndex >= categories.length) {
      print("⚠️ Index sélectionné invalide !");
      return Center(child: Text("Catégorie non valide"));
    }

    final articles =
        newsProvider.getNewsByCategory(categories[_selectedTabIndex] ?? '');

// Vérifie si des articles sont bien récupérés
    if (articles.isEmpty) {
      print("⚠️ Aucun article trouvé pour la catégorie sélectionnée !");
    }

    for (var article in articles) {
      print(
          "Article: ${article.title}, ${article.category}, ${article.imageUrl}");
    }

// Met à jour _clickedItems en fonction du nombre d'articles
    if (_clickedItems.length != articles.length) {
      _clickedItems = List.generate(articles.length, (_) => false);
    }

    // Remplacer temporairement par un simple retour pour tester les données récupérées
    /*  return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Categories:"),
          // Affiche les catégories récupérées
          for (var category in categories) Text(category ?? "Pas de catégorie"),

          SizedBox(height: 20),

          Text("Articles:"),
          // Affiche les articles récupérés
          for (var article in articles)
            Text(article.title ?? "Pas de titre d'article"),

          // Optionnel : vérifier l'état de chargement
          if (newsProvider.isLoading) const CircularProgressIndicator(),
          if (articles.isEmpty) const Text("Aucun article disponible"),
        ],
      ),
    ); */

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Onglets de catégories
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: _selectedTabIndex == index
                          ? Colors.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index]!,
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
        newsProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : articles.isEmpty
                ? const Center(child: Text("Aucun article disponible"))
                : ListView.builder(
                    shrinkWrap:
                        true, // Cela permet à la ListView de s'adapter à la taille de son parent
                    physics:
                        NeverScrollableScrollPhysics(), // Désactive le défilement interne
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      var item = articles[index];

                      return Padding(
                        // key: ValueKey(articles[index].id),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _clickedItems[index] = true;
                            });

                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              if (!mounted)
                                return; // Vérifie que le widget est encore actif

                              setState(() {
                                _clickedItems[index] = false;
                              });

                              // Navigation avec GoRouter
                              context.push('/details', extra: item);
                            });
                          },
                          child: AnimatedContainer(
                            key: ValueKey(item.id),
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[300]!, width: 1),
                              color: _clickedItems[index]
                                  ? Colors.grey[200]
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.category,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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
                                              Icon(Icons.access_time,
                                                  color: Colors.grey, size: 15),
                                              SizedBox(width: 3),
                                              Text(
                                                "1h ago",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(FontAwesomeIcons.comment,
                                                  color: Colors.grey, size: 12),
                                              SizedBox(width: 3),
                                              Text("5",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
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
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      item.imageUrl,
                                      fit: BoxFit.cover,
                                      height: 80,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            "assets/imgs/buildding.jpg",
                                            fit: BoxFit.cover,
                                            height: 80);
                                      },
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
      ],
    );

    /* return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Onglets de catégories
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: _selectedTabIndex == index
                          ? Colors.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index]!,
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
        newsProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : articles.isEmpty
                ? const Center(child: Text("Aucun article disponible"))
                : ListView.builder(
                    shrinkWrap:
                        true, // Cela permet à la ListView de s'adapter à la taille de son parent
                    physics:
                        NeverScrollableScrollPhysics(), // Désactive le défilement interne
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      var item = articles[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _clickedItems[index] = true;
                            });

                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              setState(() {
                                _clickedItems[index] = false;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailPage(
                                    title: item.title,
                                    details: item.details,
                                  ),
                                ),
                              );
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[300]!, width: 1),
                              color: _clickedItems[index]
                                  ? Colors.grey[200]
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.category,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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
                                              Icon(Icons.access_time,
                                                  color: Colors.grey, size: 15),
                                              SizedBox(width: 3),
                                              Text("1h ago",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(FontAwesomeIcons.comment,
                                                  color: Colors.grey, size: 12),
                                              SizedBox(width: 3),
                                              Text("5",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
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
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      item.imageUrl,
                                      fit: BoxFit.cover,
                                      height: 80,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            "assets/imgs/buildding.jpg",
                                            fit: BoxFit.cover,
                                            height: 80);
                                      },
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
      ],
    ); */
  }
}
