import 'package:flutter/material.dart';

class MonWidgetStateful extends StatefulWidget {
  const MonWidgetStateful({Key? key}) : super(key: key);

  @override
  _MonWidgetStatefulState createState() => _MonWidgetStatefulState();
}

class _MonWidgetStatefulState extends State<MonWidgetStateful> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; // Incrémente le compteur et appelle setState pour mettre à jour l'interface utilisateur
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Stateful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vous avez appuyé sur le bouton cette fois : $_counter'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Incrementer'),
            ),
          ],
        ),
      ),
    );
  }
}
