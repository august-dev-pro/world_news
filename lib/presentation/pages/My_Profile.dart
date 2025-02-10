import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: Colors.grey.withOpacity(0.1),
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
            // Onglets de navigation
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          horizontal: 20, vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
