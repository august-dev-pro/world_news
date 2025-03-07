/* import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = ["Posts", "Liked", "Saved"]; // Vos onglets
    final tabContent = [
      const Center(child: Text("Posts Content")),
      const Center(child: Text("Liked Content")),
      const Center(child: Text("Saved Content")),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Mon Profil",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Action pour aller aux paramètres
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Photo de profil, nom et bouton "Editer profil"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/imgs/user.jpg'), // Votre image de profil
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Julie Candreva",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "@juliecandreva723",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Action pour éditer le profil
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.purple),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple,
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text("Éditer le Profil"),
                  ),
                ],
              ),
            ),
            // Section Stats
            Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.1)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 18, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem("Posts", "120"),
                          Container(
                              width: 1, height: 40, color: Colors.black38),
                          _buildStatItem("Followers", "2.5K"),
                          Container(
                              width: 1, height: 40, color: Colors.black38),
                          _buildStatItem("Following", "180"),
                        ],
                      ),
                    ))),
            // Onglets de navigation
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  final isSelected = index == _selectedTabIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 33, vertical: 8),
                      // margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Contenu des onglets
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: tabContent[_selectedTabIndex],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.w900,
              fontFamily: "kanit-bold"),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:world_news/data/models/news.dart';
import 'package:world_news/data/providers/news_provider.dart';
import 'package:world_news/presentation/widgets/home/article_card.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedTabIndex = 0;
  late ValueNotifier<List<bool>> clickedItems;
  List<News> postsList = [];
  List<News> likedList = [];
  List<News> savedList = [];

  void _dispatchArticles(List<News> allArticles) {
    // int total = allArticles.length;
    int postCount = 5; // Limité à 5 articles
    int likedCount = 5; // Limité à 5 articles

    postsList = allArticles.take(postCount).toList();
    likedList = allArticles.skip(postCount).take(likedCount).toList();
    savedList = allArticles.skip(postCount + likedCount).toList();
  }

  @override
  void initState() {
    super.initState();
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dispatchArticles(newsProvider.newsList);
      setState(() {
        clickedItems = ValueNotifier(
            List.generate(newsProvider.newsList.length, (index) => false));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final articles = newsProvider.newsList;

    if (articles.isEmpty) {
      print("⚠️ Aucun article trouvé pour la catégorie sélectionnée !");
    }
    final tabs = ["Posts", "Liked", "Saved"];
    final tabContent = [
      _buildArticleList(postsList), // Affiche les 5 premiers articles
      _buildArticleList(likedList), // Affiche les 5 articles likés
      _buildArticleList(savedList), // Affiche les 5 articles sauvegardés
    ];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildStatsSection(),
            _buildTabBar(tabs),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: tabContent[_selectedTabIndex],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => context.replace('/home'),
      ),
      title: const Text(
        "Mon Profil",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/imgs/user.jpg'),
          ),
          const SizedBox(height: 10),
          const Text(
            "Julie Candreva",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            "@juliecandreva723",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.purple),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              elevation: 0,
            ),
            icon: const Icon(Icons.edit, size: 16),
            label: const Text("Éditer le Profil"),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.purple.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem("Posts", "120"),
              Container(width: 1, height: 40, color: Colors.black38),
              _buildStatItem("Followers", "2.5K"),
              Container(width: 1, height: 40, color: Colors.black38),
              _buildStatItem("Following", "180"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(List<String> tabs) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) {
          final isSelected = index == _selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedTabIndex = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

/*   Widget _buildArticleList(List articles) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(
          item: articles[index],
          index: index,
          clickedItems: clickedItems,
        );
      },
    );
  } */

  Widget _buildArticleList(List<News> articles) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Empêche le défilement interne
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(
          item: articles[index],
          index: index,
          clickedItems: clickedItems,
        );
      },
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 16, fontFamily: "kanit-bold"),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
