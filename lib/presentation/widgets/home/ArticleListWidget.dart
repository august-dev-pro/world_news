import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Remplace par la taille de ta liste d'articles
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.article),
            title: Text('Article ${index + 1}'),
            subtitle: Text('Extrait de l\'article ${index + 1}'),
          ),
        );
      },
    );
  }
}
