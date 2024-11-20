import 'package:flutter/material.dart';

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
          onPressed: () => Navigator.pop(context),
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
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    child: Row(
                      children: [
                        Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.black54,
                          size: 24,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '42', // Exemple de nombre de likes
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Bouton Commentaire avec le nombre de commentaires
                  GestureDetector(
                    onTap: () {
                      // Logique pour les commentaires
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.comment,
                          color: Colors.black54,
                          size: 24,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '15', // Exemple de nombre de commentaires
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(), // Ajoute un espace flexible entre les deux sections
              // Section droite : Cercle de feedback
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: _scrollProgress / 100,
                      strokeWidth: 4,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.indigoAccent),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '${_scrollProgress.toInt()}%',
                    style: const TextStyle(
                      fontSize: 14,
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
