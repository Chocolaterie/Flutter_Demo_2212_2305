import 'package:flutter/material.dart';

void main() {
  runApp(const DemoLayoutApp());
}

// Le router de l'application
class DemoLayoutApp extends StatelessWidget {
  const DemoLayoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Layout',
      home: DemoLayoutPage(),
    );
  }
}

// La page de la demo
class DemoLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Layout"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Ligne 1"),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text("Ligne 2"),
            ),
            Row(children: [
              Expanded(child: Text("Colonne 1")),
              Text("Colonne 2")
            ],),
            Flex(direction: Axis.vertical, children: [
              Text("Flex ligne 1"),
              Text("Flex ligne 2")
            ],),
            Flex(direction: Axis.horizontal, children: [
              Text("Flex colonne 1"),
              Text("Flex colonne 2"),
            ],)
          ],
        ),
      ),
    );
  }
}
