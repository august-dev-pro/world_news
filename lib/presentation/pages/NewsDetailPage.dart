import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/data/models/news.dart';

class NewsDetailPage extends StatefulWidget {
  final News newData;

  const NewsDetailPage(this.newData) /* : super(key: key) */;

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      setState(() {
        _scrollProgress =
            (currentScroll / maxScrollExtent).clamp(0.0, 1.0) * 100;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic),
            onPressed: () {
              // Logique pour l'icône de casque
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Logique pour les paramètres supplémentaires
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ), */

      // extendBodyBehindAppBar: true, // Permet au contenu de passer sous l'AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.white, // Rend l'AppBar transparente
          elevation: 0, // Supprime l'ombre
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.black), // Icône blanche
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.headset_mic, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),

      // contenu
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image avec bords arrondis
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.verified,
                            color: Colors.blue, size: 15), // Icône vérifiée
                        const SizedBox(width: 2),
                        const Text(
                          'Michael David Smith',
                          style: TextStyle(
                              fontFamily: 'Quicksand-Bold',
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.arrow_right,
                            color: Colors.grey, size: 20), // Flèche
                        const SizedBox(width: 4),
                        const Text(
                          'categorie',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              fontFamily: "kanit-thin",
                              color: Color.fromARGB(255, 92, 92, 92)),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          /* logique pour faire l'action de follow */
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7D26DF).withOpacity(0.1),
                            border:
                                Border.all(color: Color(0xFF7D26DF), width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7D26DF),
                                // Texte violet
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand-Bold'),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Titre
              Text(
                widget.newData.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Quicksand-Bold",
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 18),

              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)
                    /*      topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0), */
                    ),
                child: Image.network(
                  widget.newData.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/imgs/default.jpg", // Image de secours si l'URL est invalide
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Détails
              Text(
                widget.newData.details,
                style: const TextStyle(
                  fontFamily: 'kanit-thin',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.newData.details,
                style: const TextStyle(
                  fontFamily: 'kanit-thin',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Aliquam erat volutpat. Donec ac diam ut libero elementum '
                'condimentum. Phasellus pretium ligula et sem tincidunt.',
                style: TextStyle(
                  fontFamily: 'kanit-thin',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Vestibulum vel dolor nec ipsum varius vehicula. Integer '
                'congue eros et ex cursus, et convallis nulla feugiat.'
                'congue eros et ex cursus, et convallis nulla feugiat.'
                'congue eros et ex cursus, et convallis nulla feugiat.'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Vestibulum vel dolor nec ipsum varius vehicula. Integer '
                'congue eros et ex cursus, et convallis nulla feugiat.',
                style: TextStyle(
                  fontFamily: 'kanit-thin',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Aliquam erat volutpat. Donec ac diam ut libero elementum '
                'condimentum. Phasellus pretium ligula et sem tincidunt.',
                style: TextStyle(
                  fontFamily: 'kanit-thin',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),

      // bar de navigation de bas
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(66, 92, 92, 92), // Couleur de l'ombre
              blurRadius: 4, // Flou de l'ombre
              offset: Offset(2, 2), // Décalage de l'ombre
            )
          ],
          border: Border(
            top: BorderSide(
                color: Color.fromARGB(52, 224, 224, 224), width: 1.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 50),
          child: Row(
            children: [
              // Section gauche : Like et Comment
              Row(
                children: [
                  // Bouton Like avec le nombre de likes
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(30),
                        /*  boxShadow: _isLiked
                            ? [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                )
                              ]
                            : [], */
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            color: _isLiked ? Colors.red : Colors.black54,
                            size: 22,
                            shadows: _isLiked
                                ? [
                                    Shadow(
                                      color: Colors.red.withOpacity(1),
                                      offset: const Offset(0, 2),
                                      blurRadius: 10,
                                    ),
                                  ]
                                : [],
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '46K', // Exemple de nombre de likes
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontFamily: 'Quicksand-Bold'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Bouton Commentaire avec le nombre de commentaires
                  GestureDetector(
                    onTap: () {
                      // Logique pour les commentaires
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.black87,
                            size: 17,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '97', // Exemple de nombre de commentaires
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontFamily: 'Quicksand-Bold'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Section droite : Cercle de feedback
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: CircularProgressIndicator(
                      value: _scrollProgress / 100,
                      strokeWidth: 3,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF7D26DF)),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '${_scrollProgress.toInt()}%',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
