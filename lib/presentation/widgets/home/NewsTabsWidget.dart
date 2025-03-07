import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/data/providers/news_provider.dart';
import 'package:world_news/presentation/widgets/home/article_card.dart';

class NewsTabsWidget extends StatefulWidget {
  const NewsTabsWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsTabsWidgetState createState() => _NewsTabsWidgetState();
}

class _NewsTabsWidgetState extends State<NewsTabsWidget> {
  late ValueNotifier<List<bool>> clickedItems;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<NewsProvider>(context, listen: false).loadNews());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final newsProvider = Provider.of<NewsProvider>(context, listen: false);
        clickedItems = ValueNotifier(
            List.generate(newsProvider.newsList.length, (index) => false));
      });
    });
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

    // Met à jour _clickedItems en fonction du nombre d'articles
    if (_clickedItems.length != articles.length) {
      _clickedItems = List.generate(articles.length, (_) => false);
      clickedItems.value = List.generate(articles.length, (_) => false);
      clickedItems.notifyListeners(); // Notifie les changements
    }

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
                      // Assurez-vous que l'index est dans la plage des éléments cliqués
                      if (index >= clickedItems.value.length) {
                        return SizedBox(); // Empêche l'erreur en renvoyant un widget vide
                      }

                      return ArticleCard(
                        item: articles[index],
                        index: index,
                        clickedItems: clickedItems,
                      );
                    },
                  ),
      ],
    );
  }
}
