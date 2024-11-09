import 'dart:async'; // Importer dart:async pour utiliser Timer
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<Map<String, String>> fakeData = [
    {
      'image': 'assets/imgs/buildding.jpg',
      'text':
          "Guerre en Ukraine : le président s'est rendu à Kiev pour un tête-à-tête avec Poutine",
    },
    {
      'image': 'assets/imgs/climatReunion.jpeg',
      'text':
          "Climat : les pays se réunissent pour trouver des solutions durables",
    },
    {
      'image': 'assets/imgs/marches-financiers.jpg',
      'text': "Économie : les marchés en hausse malgré les incertitudes",
    },
  ];

  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_currentPage < fakeData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Retourne au début
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
      child: SizedBox(
        height: 320,
        child: PageView.builder(
          controller: _pageController,
          itemCount: fakeData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          fakeData[index]['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 8,
                        child: ElevatedButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black, // Couleur de fond noire
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20.0), // Coins arrondis
                            ),
                          ),
                          child: const Text(
                            'Trending',
                            style: TextStyle(
                              fontFamily: "Quicksand-Bold",
                              color: Colors.white, // Couleur du texte blanche
                              fontWeight: FontWeight.bold, // Texte en gras
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  fakeData[index]['text']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand-Bold",
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const SizedBox(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("World",
                            style: TextStyle(
                              fontFamily: "kanit-Light",
                              color: Color.fromARGB(179, 56, 56, 56),
                              fontSize: 13,
                            )),
                        SizedBox(
                          child: Row(
                            children: [
                              // Indicateur de temps
                              SizedBox(
                                child: Row(children: [
                                  Icon(
                                    Icons.access_time, // Icône d'horloge
                                    color: Color.fromARGB(255, 128, 128, 128),
                                    size: 18,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "1h ago",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Quicksand-Bold",
                                      color: Color.fromARGB(179, 56, 56, 56),
                                      fontSize: 13,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(width: 10),
                              // Indicateur de commentaires
                              SizedBox(
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons
                                        .comment, // Icône de commentaire arrondi
                                    color: Color.fromARGB(255, 128, 128, 128),
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Quicksand-Bold",
                                      color: Color.fromARGB(179, 56, 56, 56),
                                      fontSize: 14,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Following",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Kanit-Bold",
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "View More",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand-Bold",
                                color: Color.fromARGB(179, 10, 54, 197),
                                fontSize: 14,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
