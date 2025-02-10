import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NewsDetailPage extends StatefulWidget {
  final String title;
  final String details;

  const NewsDetailPage({
    super.key,
    required this.title,
    required this.details,
  });

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
      appBar: AppBar(
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
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Quicksand-Bold",
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Image avec bords arrondis
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  "assets/imgs/buildding.jpg",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Détails
              Text(
                widget.details,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Vestibulum vel dolor nec ipsum varius vehicula. Integer '
                'congue eros et ex cursus, et convallis nulla feugiat.',
                style: TextStyle(
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
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Color.fromARGB(52, 224, 224, 224), width: 1.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 5),
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
                          left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
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
                            ),
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
                          left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
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
                            ),
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
                          Colors.indigoAccent),
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
